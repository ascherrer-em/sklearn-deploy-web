<template>
  <div class="container">
    <button type="button" class="btn btn-primary">{{ msg }}</button>
  </div>
</template>

<script>
export default {
  name: "Ping",
  data() {
    return {
      msg: "Hello!",
    };
  },
  methods: {
    getMessage() {
      const path = "http://backend/ping";
      this.$http
        .get(path)
        .then((res) => {
          this.msg = res.data;
        })
        .catch((error) => {
          console.error(error);
        });
    },
  },
  mounted() {
    this.getMessage();
  },
};
</script>
