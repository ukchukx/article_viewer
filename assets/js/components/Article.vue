<template>
  <!-- eslint-disable -->
  <div class="row mt-5">
    <div class="col-sm-12 col-md-4">
      <a href="/">&larr; Back</a>
    </div>
    <div class="col-sm-12 col-md-6 offset-md-3">
      <div class="card">
        <div class="card-body">
          <div class="card-title">
            <h3>{{ article.title }}</h3>
          </div>
          <p class="mb-2 text-muted">
            <span>Status:</span>
            <span v-if="isPublished(article)" class="badge badge-success">{{ article.status }}</span>
            <span v-else class="badge badge-secondary">{{ article.status }}</span>
          </p>
          <p class="mb-2 text-muted">
            <span>Access:</span>
            <span class="badge badge-info">{{ article.access }}</span>
          </p>
          <p class="mb-2 text-muted">ID: {{ article.id }}</p>
          <p class="mb-2 text-muted">Category ID: {{ article.category_id }}</p>
          <p class="mb-2 text-muted">Editor version: {{ article.editor_version }}</p>
          <p v-if="article.keywords.length" class="mb-2 text-muted">Keywords: {{ article.keywords | commaSeparatedList }}</p>
          <p class="mb-2 text-muted">Created: {{ article.created_at | readableDate }}</p>
          <p class="mb-2 text-muted">
            Creator: <img :src="article.author.gravatar" class="rounded-circle" width="25" height="25">
            {{ article.author.name }}
          </p>
          <p v-if="article.contributors.length" class="text-muted mb-2">
            Contributors:
            <img :key="c.id" v-for="c in article.contributors" class="rounded-circle" :src="c.gravatar" width="25" height="25">
          </p>
          <p v-if="article.last_publisher" class="text-muted mb-2">
            Last published:
            <img class="rounded-circle" :src="article.last_publisher.gravatar" width="25" height="25">
            {{ article.last_publisher.name }}, {{ article.last_published_at | readableDate }}
          </p>
          <p class="mb-2 text-muted">Updated: {{ article.updated_at | readableDate }}</p>
        </div>
      </div>

    </div>
  </div>
</template>

<script>
import moment from 'moment';

export default {
  name: 'SingleArticle',
  filters: {
    commaSeparatedList(list) {
      return list.join(', ');
    },
    readableDate(date) {
      return moment(date).fromNow();
    }
  },
  props: {
    article: {
      type: Object,
      required: true
    }
  },
  methods: {
    isPublished({ status }) {
      return status === 'published';
    }
  }
};
</script>
