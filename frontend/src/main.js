import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import axios from 'axios'
import VueAxios from 'vue-axios'

import 'bootstrap/dist/css/bootstrap.css'

import './assets/main.css'

const app = createApp(App)

let proto = import.meta.env.VITE_BACKEND_PROTO || 'http'
let render = (import.meta.env.VITE_DEPLOY_RENDER || 'false') == 'true'
let backend_host = import.meta.env.VITE_BACKEND_HOST || 'local'

axios.defaults.baseURL = proto + '://' + backend_host + (render ? '.onrender.com' : '')
app.use(router)
app.use(VueAxios, axios)

app.mount('#app')
