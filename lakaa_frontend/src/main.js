import { createApp } from 'vue'
import './style.css'

import { securedAxiosInstance, plainAxiosInstance } from './services/axios'
import router from './services/router'
import VueAxios from 'vue-axios'
import App from './App.vue'

createApp(App).use(router).use(VueAxios, {
  secured: securedAxiosInstance,
  plain: plainAxiosInstance
}).mount('#app')
