const { parseMultipartData, sanitizeEntity } = require('strapi-utils');

module.exports = {
  /**
   * Create a record.
   *
   * @return {Object}
   */
  async create(ctx) {
    let entity;
    if (ctx.is('multipart')) {
      const { data, files } = parseMultipartData(ctx);
      data.author = ctx.state.user.id;
      entity = await strapi.services.topic.create(data, { files });
    } else {
      ctx.request.body.author = ctx.state.user.id;
      entity = await strapi.services.topic.create(ctx.request.body);
    }
    return sanitizeEntity(entity, { model: strapi.models.topic });
  },

  /**
   * Update a record.
   *
   * @return {Object}
   */
  async update(ctx) {
    const { id } = ctx.params;

    let entity;

    const [topic] = await strapi.services.topic.find({
      id: ctx.params.id,
      'author.id': ctx.state.user.id,
    });

    if (!topic) {
      return ctx.unauthorized(`You can't update this entry`);
    }

    if (ctx.is('multipart')) {
      const { data, files } = parseMultipartData(ctx);
      entity = await strapi.services.topic.update({ id }, data, {
        files,
      });
    } else {
      entity = await strapi.services.topic.update({ id }, ctx.request.body);
    }

    return sanitizeEntity(entity, { model: strapi.models.topic });
  },

      /**
   * Delete a record.
   *
   * @return {Object}
   */
  async delete(ctx) {
    const { id } = ctx.params;

    let entity;

    const [topic] = await strapi.services.topic.find({
      id: ctx.params.id,
      'author.id': ctx.state.user.id,
    });

    if (!topic) {
      return ctx.unauthorized(`You can't delete this entry`);
    }

    entity = await strapi.services.topic.delete({ id })

    return sanitizeEntity(entity, { model: strapi.models.topic });
  },
};
