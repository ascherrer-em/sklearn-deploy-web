<template>
    <HeaderBar></HeaderBar>

    <main class="flex-shrink-0">
        <div class="container">
            <RouterView />
        </div>
    </main>

    <FooterBar></FooterBar>
</template>

<script setup>
import { RouterView } from 'vue-router'
</script>

<script>
import HeaderBar from './components/HeaderBar.vue'
import FooterBar from './components/FooterBar.vue'
export default {
    components: {
        HeaderBar,
        FooterBar,
    },
}
</script>
