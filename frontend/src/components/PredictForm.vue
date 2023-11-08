<template>
    <div class="py-5 text-center">
        <h2>Get prediction!</h2>
        <p class="lead">Complete the form with feature values and get the prediction!</p>
    </div>

    <div class="row g-5">
        <div class="col-md-7 col-lg-8">
            <h4 class="mb-3">Features</h4>
            <form class="needs-validation" novalidate="">
                <div class="row g-3">
                    <div class="col-sm-6">
                        <label for="age" class="form-label">Age</label>
                        <input type="text" class="form-control" id="age" placeholder="25" v-model="age" required="" />
                        <div class="invalid-feedback">Valid value is required.</div>
                    </div>

                    <div class="col-sm-6">
                        <label for="salary" class="form-label">Salary</label>
                        <input
                            type="text"
                            class="form-control"
                            id="salary"
                            placeholder=""
                            v-model="salary"
                            required=""
                        />
                        <div class="invalid-feedback">Valid value is required.</div>
                    </div>
                </div>
                <hr class="my-4" />

                <button class="w-100 btn btn-primary btn-lg" type="submit" @click.prevent="doSubmit()">Predict</button>
            </form>
        </div>
        <div class="col-md-5 col-lg-4">
            <h4 class="d-flex justify-content-between align-items-center mb-3">
                <span class="text-primary">Prediction</span>
            </h4>
        </div>
    </div>
</template>

<script>
export default {
    name: 'PredictForm',
    data() {
        return {
            age: null,
            salary: null,
            predicted_class: null,
        }
    },
    mounted() {},
    methods: {
        doSubmit() {
            console.log('Submit features to ML model')
            this.predicted_class = null
            let payload = {
                age: this.age,
                salary: this.salary,
            }
            this.$http
                .post('/api/predict', payload, {
                    'Content-Type': 'application/json',
                })
                .then((res) => {
                    console.log(res)
                    this.predicted_class = res.data.class
                })
                .catch((e) => {
                    console.log(e)
                })
        },
    },
}
</script>
