import './base.css'

import { getRandomColor } from './random-color.js'


for (const p of document.querySelectorAll('p')) {
    p.addEventListener('click', () => {
        p.style.color = getRandomColor()
    })
}
