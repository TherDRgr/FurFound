// document.addEventListener('DOMContentLoaded', function() {
//   const notifyButton = document.getElementById("notify-btn");
  
//   if (notifyButton) {
//     notifyButton.addEventListener("click", function() {
//       if (navigator.geolocation) {
//         navigator.geolocation.getCurrentPosition(function(position) {
//           let latitude = position.coords.latitude;
//           let longitude = position.coords.longitude;

//           fetch(notifyButton.getAttribute('data-url'), {
//             method: 'POST',
//             headers: {
//               'Content-Type': 'application/json',
//               'X-CSRF-Token': document.querySelector("meta[name='csrf-token']").content,
//               'Accept': 'application/javascript'
//             },
//             body: JSON.stringify({ latitude: latitude, longitude: longitude }),
//             credentials: 'same-origin'
//           })
//           .then(response => response.text())
//           .then(data => {
//             const script = document.createElement('script');
//             script.textContent = data;
//             document.body.appendChild(script);
//           });
//         });
//       } else {
//         alert("Geolocation is not supported by this browser.");
//       }
//     });
//   }
// });
