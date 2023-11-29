    //numero de usuarios
    const numberOfProfiles = 57;

    const parentElement = document.querySelector('.ranking');

    //criar os usurarios no ranking
    for (let i = 0; i < numberOfProfiles; i++) {

        const rankerUserDiv = document.createElement('div');
        rankerUserDiv.className = 'ranker-user';

        const imgElement = document.createElement('img');
        imgElement.src = '../imgs/user-img.png';
        imgElement.alt = '';

        const h1Element = document.createElement('h1');
        h1Element.textContent = 'Felipe Daniel';

        const xpDiv = document.createElement('div');
        xpDiv.className = 'XP';
        xpDiv.textContent = '000000 ';

        const xpSpan = document.createElement('span');
        xpSpan.textContent = 'XP';

        xpDiv.appendChild(xpSpan);
        rankerUserDiv.appendChild(imgElement);
        rankerUserDiv.appendChild(h1Element);
        rankerUserDiv.appendChild(xpDiv);

        parentElement.appendChild(rankerUserDiv);
    }