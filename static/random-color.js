export function getRandomColor() {
    return '#' + Math.floor(Math.random() * 0xfff).toString(16).padStart(3, '0')
}
