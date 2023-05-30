import { createApp } from 'vue'
import 'chota'

import router from './services/router'
import App from './App.vue'

createApp(App).use(router).mount('#app')
