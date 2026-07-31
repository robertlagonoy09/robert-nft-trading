document.addEventListener("DOMContentLoaded", () => {
    console.log("Robert NFT Marketplace loaded successfully.");

    let currentUser = null;

    // 1. INIT PI TESTNET
    Pi.init({ version: "2.0", sandbox: true });

    // 2. PI LOGIN BUTTON
    const loginBtn = document.getElementById("pi-login-btn");
    const usernameSpan = document.getElementById("username");

    if (loginBtn) {
        loginBtn.addEventListener("click", function() {
            const scopes = ['username', 'payments'];
            Pi.authenticate(scopes, onIncompletePaymentFound)
            .then(function(auth) {
                currentUser = auth.user;
                if(usernameSpan) usernameSpan.innerText = "Hi, " + auth.user.username;
                loginBtn.innerText = "Logged In ✓";
                alert("Welcome " + auth.user.username + "!");
            }).catch(function(error) {
                console.error(error);
                alert("Login failed: " + error);
            });
        });
    }

    // 3. PI BUY BUTTONS
    const buyButtons = document.querySelectorAll('.buy');
    buyButtons.forEach(button => {
        button.addEventListener('click', function() {
            if(!currentUser){
                alert("Please Login with Pi first!");
                return;
            }
            const price = parseFloat(this.getAttribute('data-price'));
            const name = this.getAttribute('data-name');
            const id = this.getAttribute('data-id');

            Pi.createPayment({
                amount: price,
                memo: "Buy " + name,
                metadata: { nft_id: id, buyer: currentUser.username }
            }, {
                onReadyForServerApproval: function(paymentId) { 
                    console.log("Waiting for approval", paymentId);
                    // DITO MO LALAGAY YUNG BACKEND MO LATER
                },
                onReadyForServerCompletion: function(paymentId, txid) { 
                    alert("Success! You bought " + name + " for " + price + " Test Pi");
                    console.log("TXID:", txid);
                },
                onCancel: function(paymentId) { 
                    alert("Payment cancelled"); 
                },
                onError: function(error, payment) { 
                    alert("Error: " + error); 
                    console.error(error);
                }
            });
        });
    });

    // 4. HANDLE INCOMPLETE PAYMENTS
    function onIncompletePaymentFound(payment) { 
        console.log("Found incomplete payment:", payment);
    }
});