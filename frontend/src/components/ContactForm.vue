<template>
    <div class="max-w-md mx-auto my-auto mt-8 p-6 bg-white rounded-lg shadow-md font-mono">
      <h1 class="text-3xl font-bold mb-4 text-center">Contact Us</h1>
      <form @submit.prevent="submitForm">
        <div class="mb-4">
          <label for="name" class="block text-gray-700">Name:</label>
          <input type="text" v-model="formData.name" id="name" name="name" class="form-input mt-1 block w-full" placeholder="Enter your name">
          <span v-if="errors.name" class="text-red-500">{{ errors.name }}</span>
        </div>
        <div class="mb-4">
          <label for="email" class="block text-gray-700">Email:</label>
          <input type="email" v-model="formData.email" id="email" name="email" class="form-input mt-1 block w-full" placeholder="Enter your email">
          <span v-if="errors.email" class="text-red-500">{{ errors.email }}</span>
        </div>
        <div class="mb-4">
          <label for="phone" class="block text-gray-700">Phone:</label>
          <input type="tel" v-model="formData.phone" id="phone" name="phone" class="form-input mt-1 block w-full" placeholder="Enter your phone number">
          <span v-if="errors.phone" class="text-red-500">{{ errors.phone }}</span>
        </div>
        <div class="mb-4">
          <label for="message" class="block text-gray-700">Message:</label>
          <textarea v-model="formData.message" id="message" name="message" rows="4" class="form-textarea mt-1 block w-full" placeholder="Enter your message"></textarea>
          <span v-if="errors.message" class="text-red-500">{{ errors.message }}</span>
        </div>
        <p v-if="status == 'success'" class="pt-2 mb-2 font-mono text-center text-green-500">{{ response }}</p>
        <p v-if="status == 'failed'" class="pt-2 mb-2 font-mono text-center text-red-500">{{ response }}</p>
        <button type="submit" class="hover:border hover:bg-white bg-purple-700 border text-white hover:border-purple-700 hover:text-purple-700 text-white font-bold py-2 px-4 rounded w-full ">Submit</button>
      </form>
      <p class="pt-2 mb-2 font-mono text-center"><RouterLink RouterLink to="/entries"><strong class="underline hover:text-purple-700 cursor-pointer">Click here</strong></RouterLink> to view saved entries!</p>
    </div>
  </template>
  
  
  
  <script>
  import axios from 'axios';
  export default {
    data() {
      return {
        formData: {
          name: '',
          email: '',
          phone: '',
          message: ''
        },
        errors: {},
        response: null,
        status: null,
       
      };
    },
    methods: {
      submitForm() {
  
        this.errors = {};
        if (!this.formData.name) {
          this.errors.name = 'Name is required';
        }
        if (!this.formData.email) {
          this.errors.email = 'Email is required';
        } else if (!this.isValidEmail(this.formData.email)) {
          this.errors.email = 'Invalid email format';
        }
        if (!this.formData.phone) {
          this.errors.phone = 'Phone is required';
        } else if (!this.isValidPhone(this.formData.phone)) {
          this.errors.phone = 'Invalid phone number';
        }
        if (!this.formData.message) {
          this.errors.message = 'Message is required';
        }
  
        // If no errors, submit the form
        if (Object.keys(this.errors).length === 0) {
            axios.post('http://localhost:8000/save_entry.php', this.formData)
            .then(response => {
                console.log(response.data);

                this.status = response.data.status;

                if(this.status == 'success'){
                    this.formData = {
                        name: '',
                        email: '',
                        phone: '',
                        message: ''
                    };

                    this.response = response.data.message;
                }else{
                    this.response = 'Was not saved please try again!'
                }
            })
            .catch(error => {
                console.error('Error submitting form:', error);
            });

         
        }
      },
      isValidEmail(email) {
        return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
      },
      isValidPhone(phone) {

        return /^(?:0|\+?27\s?)(\d{2}\s?\d{3}\s?\d{4}|\d{9})$/.test(phone);

      }
    }
  };
  </script>