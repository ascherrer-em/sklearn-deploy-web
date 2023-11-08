<template>
  COUCOU
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
      const path = "/api/ping";
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
