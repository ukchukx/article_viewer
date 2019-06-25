<template>
  <!-- eslint-disable -->
  <div class="row mt-5">
    <div class="col-sm-12 text-center">
      <h1 v-if="terms.length" class="text-muted">Search results</h1>
      <h1 v-else class="text-muted">My Articles</h1>
    </div>
    <div class="col-sm-12">
      <div class="row">
        <div class="offset-md-8 col-md-4 col-sm-12 mb-3 text-right">
          <form action="/" method="GET">
            <div class="input-group mb-3">
              <input type="text" v-model="searchText" name="terms" class="form-control" placeholder="Search by keyword">
              <div class="input-group-append">
                <button type="submit" class="btn btn-secondary">Search</button>
              </div>
            </div>
          </form>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-12">
          <table class="table">
            <thead>
              <tr v-if="terms.length">
                <th></th>
                <th>Title</th>
              </tr>
              <tr v-else>
                <th></th>
                <th>Title</th>
                <th>Status</th>
                <th>Keywords</th>
                <th>Last updated</th>
              </tr>
            </thead>
            <tbody v-if="terms.length">
              <tr :key="article.id" v-for="(article, i) in localArticles">
                <td>{{ i + 1 }}</td>
                <td>
                  <a :href="articleUrl(article)" v-html="article.title"></a>
                </td>
              </tr>
            </tbody>
            <tbody v-else>
              <tr :key="article.id" v-for="(article, i) in localArticles">
                <td>{{ i + 1 }}</td>
                <td>
                  <a :href="articleUrl(article)">{{ article.title }}</a>
                </td>
                <td>
                  <span v-if="isPublished(article)" class="badge badge-success">{{ article.status }}</span>
                  <span v-else class="badge badge-secondary">{{ article.status }}</span>
                </td>
                <td>{{ article.keywords | commaSeparatedList }}</td>
                <td>{{ article.updated_at | readableDate }}</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
      <div class="row">
        <div class="col-md-4 col-sm-12 offset-md-8 text-right">
          <b-pagination
            align="right"
            v-model="currentPage"
            :total-rows="localArticles.length"
            :per-page="perPage"
            class="my-0"
          ></b-pagination>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import moment from 'moment';

export default {
  name: 'Articles',
  filters: {
    commaSeparatedList(list) {
      return list.join(', ');
    },
    readableDate(date) {
      return moment(date).fromNow();
    }
  },
  props: {
    articles: {
      type: Array,
      required: true
    },
    terms: {
      type: String,
      required: true
    }
  },
  data() {
    return {
      currentPage: 1,
      perPage: 5,
      searchText: this.terms,
      localArticles: [...this.articles]
    };
  },
  methods: {
    isPublished({ status }) {
      return status === 'published';
    },
    articleUrl({ id }) {
      return `/${id}`;
    }
  }
};
</script>
