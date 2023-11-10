<template>
    <div class="row bg-white py-3">
        <div class="py-3 text-center">
            <h2>Social network ad purchase prediction</h2>
            <p class="lead">
                Complete the form with feature values and get the prediction on whether such customer is likely (or not)
                to purchase a social media advertisment
            </p>
        </div>

        <div class="row gx-3">
            <div class="col-md-7 col-lg-8 p-5">
                <h4 class="mb-3">Features</h4>
                <form class="needs-validation" novalidate="">
                    <div class="row">
                        <div class="col-sm-6">
                            <label for="age" class="form-label">Age</label>
                            <input
                                id="age"
                                v-model="age"
                                type="text"
                                class="form-control"
                                placeholder="25"
                                required=""
                            />
                            <div class="invalid-feedback">Valid value is required.</div>
                        </div>

                        <div class="col-sm-6">
                            <label for="salary" class="form-label">Salary (yearly in k$)</label>
                            <input
                                id="salary"
                                v-model="salary"
                                type="text"
                                class="form-control"
                                placeholder="50"
                                required=""
                            />
                            <div class="invalid-feedback">Valid value is required.</div>
                        </div>
                    </div>
                    <hr class="my-4" />

                    <button
                        class="w-100 btn btn-primary btn-lg"
                        type="submit"
                        :disabled="loading === true"
                        @click.prevent="doSubmit()"
                    >
                        Predict
                    </button>
                </form>
            </div>
            <div class="col-md-5 col-lg-4 p-5">
                <h4 class="d-flex justify-content-between align-items-center mb-3">
                    <span class="text-primary">Prediction</span>
                </h4>
                <div v-if="predicted_class === 0" class="alert alert-danger" role="alert">
                    The customer will <b>likely NOT</b> buy an ad.
                </div>
                <div class="alert alert-success" role="alert" v-else-if="predicted_class === 1">
                    The customer will <b>likely</b> buy an ad.
                </div>
                <div class="alert alert-success" role="alert" v-else-if="error !== null">
                    {{ error }}
                </div>
                <div class="alert alert-gray" role="alert" v-else>
                    <span v-if="loading"> pending... </span>
                    <span v-else> no prediction to display.</span>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: 'PredictForm',
    data() {
        return {
            age: 30,
            loading: false,
            salary: 100,
            error: null,
            predicted_class: null,
        }
    },
    mounted() {},
    methods: {
        doSubmit() {
            if (this.loading) {
                console.log('Disable double clicks...')
                return
            }
            console.log('Submit features to ML model at', this.$http.defaults.baseURL)
            this.predicted_class = null
            this.loading = true
            this.error = null
            let payload = {
                age: this.age,
                salary: this.salary * 1000,
            }
            this.$http
                .post('/api/predict', payload, {
                    'Content-Type': 'application/json',
                })
                .then((res) => {
                    console.log(res)
                    this.predicted_class = res.data.class
                })
                .catch((error) => {
                    console.log(error)
                    this.error = 'An error occured, backend server issue?'
                })
                .finally(() => {
                    this.loading = false
                })
        },
    },
}
</script>
