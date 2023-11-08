import { createRouter, createWebHistory } from "vue-router";
import Ping from "../components/Ping.vue";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/",
      redirect: { path: "/predict" },
      name: "home",
    },
    {
      path: "/ping",
      name: "ping",
      component: Ping,
    },
    {
      path: "/predict",
      name: "predict",
      component: Predict,
    },
  ],
});

export default router;
