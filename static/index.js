import './base.css'

import { CSS_CLASS_ACTIVE } from './constants'


for (const p of document.querySelectorAll('p')) {
    p.addEventListener('click', () => {
        p.classList.toggle(CSS_CLASS_ACTIVE)
    })
}
