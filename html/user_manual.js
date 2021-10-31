const manualBtn = document.querySelector('.user-manual__toggle-btn');
const stepList = document.querySelector('.user-manual__step-list');

manualBtn.onclick = () => {
    stepList.classList.toggle('user-manual__step-list--active');
    let check = 0;

    for (let c of stepList.classList) {
        if (c === 'user-manual__step-list--active') check++;
    }
    if (check === 1) {
        manualBtn.innerText = 'Ẩn hướng dẫn';
    } else {
        manualBtn.innerText = 'Xem hướng dẫn';
    }
};
