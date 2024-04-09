<template>
  <div
    class="max-w-md mx-auto my-auto mt-8 p-6 bg-white rounded-lg shadow-md font-mono"
  >
    <h1 class="text-3xl font-bold mb-4 text-center underline">Saved Entries</h1>
    <ul>
      <li v-for="entry in paginatedEntries" :key="entry.id" class="mb-4">
        <div class="font-bold">Name: {{ entry.name }}</div>
        <div>Email: {{ entry.email }}</div>
        <div>Phone: {{ entry.phone }}</div>
        <div>Message: {{ entry.message }}</div>
      </li>
    </ul>
    <h1 v-if="entries.length == 0" class="text-3xl font-bold mb-4 text-center">No Entries Found</h1>
    <p class="pt-2 mb-2 font-mono text-center">
      <RouterLink RouterLink to="/"
        ><strong class="underline hover:text-purple-700 cursor-pointer"
          >Click here</strong
        ></RouterLink
      >
      to view contact form!
    </p>
    <div class="flex justify-center">
      <button
        @click="prevPage"
        :disabled="currentPage === 1"
        class="hover:border hover:bg-white bg-purple-700 border text-white hover:border-purple-700 hover:text-purple-700 mr-2 px-4 py-2 rounded-lg"
      >
        Previous
      </button>
      <button
        @click="nextPage"
        :disabled="currentPage === totalPages"
        class="hover:border hover:bg-white bg-purple-700 border text-white hover:border-purple-700 hover:text-purple-700 ml-2 px-4 py-2 rounded-lg"
      >
        Next
      </button>

      
    </div>
    <p class=" font-mono text-right">{{ currentPage }}</p>
  </div>
</template>
  
  
  <script>
    import axios from 'axios';
    export default {
      data() {
        return {
          entries: [],

          currentPage: 1,
          entriesPerPage: 4,
        };
      },
      mounted() {
        this.fetchEntries();
      },

      computed: {
        totalPages() {
          return Math.ceil(this.entries.length / this.entriesPerPage);
        },
        paginatedEntries() {
          const startIndex = (this.currentPage - 1) * this.entriesPerPage;
          const endIndex = startIndex + this.entriesPerPage;
          return this.entries.slice(startIndex, endIndex);
        }
      },
      methods: {
        fetchEntries() {
            axios.get('http://localhost:8000/fetch_entries.php')
            .then(response => {
                console.log(response.data);

                this.status = response.data.status;

                if(this.status == 'success'){
                    this.entries = response.data.data;
                }
            })
            .catch(error => {
                console.error('Error submitting form:', error);
            });
        },

        nextPage() {
          if (this.currentPage < this.totalPages) {
            this.currentPage++;
          }
        },
        prevPage() {
          if (this.currentPage > 1) {
            this.currentPage--;
          }
        }
      },
    };
</script>
