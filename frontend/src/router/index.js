import { createRouter, createWebHistory } from 'vue-router'
import CheckServerConnexion from '../components/CheckServerConnexion.vue'
import PredictForm from '../components/PredictForm.vue'

const router = createRouter({
    history: createWebHistory(import.meta.env.BASE_URL),
    routes: [
        {
            path: '/',
            redirect: { path: '/predict' },
            name: 'home',
        },
        {
            path: '/check',
            name: 'check',
            component: CheckServerConnexion,
        },
        {
            path: '/predict',
            name: 'predict',
            component: PredictForm,
        },
    ],
})

export default router
