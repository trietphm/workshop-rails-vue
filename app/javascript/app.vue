<template>
<div class="container">
  <div class="submit-form">
    <h1>Workshop: Sample Book List</h1>
    <div class="col-md-6">
      <h4>Add new book:</h4>
      <div>
        <div class="form-group">
          <label for="title">Title </label>
          <input
            type="text"
            class="form-control"
            id="title"
            required
            v-model="book.title"
            name="title"
          />
        </div>

        <button @click="createBook" class="btn btn-success">Add</button>
      </div>
    </div>
  </div>
  <div class="list row">
    <div class="col-md-6">
      <h4>Books:</h4>
      <ul class="list-group">
        <li class="list-group-item"
          :class="{ active: index == currentIndex }"
          v-for="(book, index) in books"
          :key="index"
          @click="setActiveBook(book, index)"
        >
          {{ book.title }}
        </li>
      </ul>
    </div>
    <div class="col-md-6">
      <h4>Selected Book</h4>
      <div v-if="currentBook">
        <div>
          <label><strong>Title:</strong></label> {{ currentBook.title }}
        </div>
        <button class="m-3 btn btn-sm btn-danger" @click="deleteBook">
          Delete
        </button>
      </div>
      <div v-else>
        <br />
        <p>Please select a book...</p>
      </div>
    </div>
  </div>
</div>
</template>

<script>
import BookDataService from "services/BookDataService";

export default {
  name: "App",
  data() {
    return {
      books: [],
      currentBook: null,
      currentIndex: -1,
      title: "",
      book: {
        id: null,
        title: "",
      },
    };
  },
  methods: {
    retrieveBooks() {
      BookDataService.getAll()
        .then(response => {
          this.books = response.data;
          console.log(response.data);
        })
        .catch(e => {
          console.log(e);
        });
    },
    refreshList() {
      this.retrieveBooks();
      this.currentBook = null;
      this.currentIndex = -1;
    },
    setActiveBook(book, index) {
      this.currentBook = book;
      this.currentIndex = book ? index : -1;
    },
    deleteBook() {
      BookDataService.delete(this.books[this.currentIndex].id)
        .then(response => {
          console.log(response.data);
          this.refreshList();
        })
        .catch(e => {
          console.log(e);
        });
    },
    createBook() {
      var data = {
        title: this.book.title,
      };
      BookDataService.create(data)
        .then(response => {
          console.log(response.data);
          this.refreshList();
          this.book = {
            id: null,
            title: "",
          }
        })
        .catch(e => {
          console.log(e);
        });
    },

  },
  mounted() {
    this.retrieveBooks();
  }
};
</script>
<style>
.list {
  text-align: left;
  max-width: 750px;
  margin: auto;
}
.submit-form {
  margin-top: 20px;
  margin-bottom: 20px;
}
</style>
