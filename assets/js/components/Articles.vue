<template>
  <!-- eslint-disable -->
  <div class="row mt-5">
    <div class="col-sm-12 text-center">
      <h1 class="text-muted">My Articles</h1>
    </div>
    <div class="col-sm-12">
      <div class="row">
        <div class="offset-md-8 col-md-4 col-sm-12 mb-3 text-right">
          <div class="input-group mb-3">
            <input type="text" v-model="searchText" class="form-control" placeholder="Search by keyword">
            <div class="input-group-append">
              <button @click="search()" class="btn btn-secondary">Search</button>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-12">
          <table class="table">
            <thead>
              <tr>
                <th></th>
                <th>Title</th>
                <th>Status</th>
                <th>Keywords</th>
                <th>Last updated</th>
              </tr>
            </thead>
            <tbody>
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
    }
  },
  data() {
    return {
      currentPage: 1,
      perPage: 5,
      searchText: '',
      localArticles: [...this.articles]
    };
  },
  methods: {
    isPublished({ status }) {
      return status === 'published';
    },
    articleUrl({ id }) {
      return `/${id}`;
    },
    search() {
      //
    }
  }
};
</script>
