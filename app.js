async function loadNFTs() {
    const response = await fetch("js/nfts.json");
    const nfts = await response.json();

    const cardsContainer = document.querySelector(".cards");

    if (!cardsContainer) return;

    cardsContainer.innerHTML = "";

    nfts.forEach(nft => {
        cardsContainer.innerHTML += `
        <div class="card">
            <img src="${nft.image}" alt="${nft.name}">
            <h3>${nft.name}</h3>
            <p>${nft.price}</p>
            <p><strong>Creator:</strong> ${nft.creator}</p>
            <a href="nft.html?id=${nft.id}" class="btn">
                View Details
            </a>
        </div>
        `;
    });
}

loadNFTs();