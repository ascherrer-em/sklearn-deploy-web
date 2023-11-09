<template>
    <div class="container mt-3">
        <div class="alert alert-{{ cls }}" role="alert">{{ msg }}</div>
    </div>
</template>

<script>
export default {
    name: 'CheckServerConnexion',
    data() {
        return {
            msg: 'Checking server...',
            cls: 'primary',
        }
    },
    mounted() {
        this.getMessage()
    },
    methods: {
        getMessage() {
            const path = '/api/check'
            this.cls = 'primary'
            this.$http
                .get(path)
                .then((res) => {
                    this.msg = res.data
                })
                .catch((error) => {
                    this.msg = 'An error occured contacting the server.'
                    this.cls = 'error'
                    console.error(error)
                })
        },
    },
}
</script>
