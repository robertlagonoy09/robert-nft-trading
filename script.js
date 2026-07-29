document.addEventListener("DOMContentLoaded", () => {
    const walletBtn = document.getElementById("walletBtn");

    if (walletBtn) {
        walletBtn.addEventListener("click", () => {
            alert("Wallet connection will be available in a future update.");
        });
    }

    console.log("Robert NFT Trading loaded successfully.");
});