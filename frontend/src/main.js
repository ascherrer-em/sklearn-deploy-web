import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import axios from 'axios'
import VueAxios from 'vue-axios'

import 'bootstrap/dist/css/bootstrap.css'

import './assets/main.css'

const app = createApp(App)

axios.defaults.baseURL = process.env.BACKEND_HOST

app.use(router)
app.use(VueAxios, axios)

app.mount('#app')
