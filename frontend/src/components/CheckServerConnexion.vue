<template>
    <div class="container mt-3">
        <div class="alert alert-primary" role="alert">{{ msg }}</div>
    </div>
</template>

<script>
export default {
    name: 'CheckServerConnexion',
    data() {
        return {
            msg: 'Hello!',
        }
    },
    mounted() {
        this.getMessage()
    },
    methods: {
        getMessage() {
            const path = '/api/ping'
            this.$http
                .get(path)
                .then((res) => {
                    this.msg = res.data
                })
                .catch((error) => {
                    console.error(error)
                })
        },
    },
}
</script>
