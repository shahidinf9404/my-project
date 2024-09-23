<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css" />
    <style>
        span[class="required"] {
            color: #ad012c;
        }
        img {
            width: 150px;
        }
        div[class="hero-body"] {
            background-color: rgb(211, 211, 211);
        }
        body {
            background-color: rgb(211, 211, 211);
            padding: 50px;
            outline: 3px dashed #000000;
            box-shadow: 5px 5px 10px black;
            outline-offset: -30px;
        }
        h4 {
            -webkit-text-fill-color: black;
        }
       @media (min-width: 768px) {
            body {
                padding: 50px;
            }
            img {
                width: 150px;
            }
        } 
    </style>
</head>
<body>
    <section class="hero is-primary is-bold">
        <div class="hero-body">
            <div class="container has-text-centered">
                <img src="https://seeklogo.com/images/N/negara-malaysia-jata-negara-logo-7AF319C752-seeklogo.com.png" alt="Logo">
                <h4 class="title">BAHAGIAN DASAR DAN HUBUNGAN ANTARABANGSA</h4>
                <h4 class="subtitle">BORANG BILIK MESYUARAT CAWANGAN ANTARABANGSA</h4>
            </div>
        </div>
    </section>
    <form id="form" class="container m-4" method="POST">
        <div class="columns is-multiline">
            <div class="column is-full">
                <div class="field">
                    <label class="label">NAMA PEGAWAI:<span class="required">*</span></label>
                    <div class="control">
                        <input class="input" id="NAMA PEGAWAI" onblur="mycapitalized()" type="text" placeholder="Nama" name="NAMA PEGAWAI" required oninvalid="setCustomValidity('Sila isi bahagian ini')" oninput="setCustomValidity('')" />
                    </div>
                </div>
            </div>
            <div class="column is-full">
                <div class="field">
                    <label class="label">UNIT/ BAHAGIAN:<span class="required">*</span></label>
                    <div class="control">
                        <input class="input" id="UNIT/ BAHAGIAN" onblur="mycapitalized()" type="text" placeholder="UNIT/ BAHAGIAN" name="UNIT/ BAHAGIAN" required oninvalid="setCustomValidity('Sila isi bahagian ini')" oninput="setCustomValidity('')" />
                    </div>
                </div>
            </div>
            <div class="column is-full">
                <div class="field">
                    <label class="label">TAJUK MESYUARAT:<span class="required">*</span></label>
                    <div class="control">
                        <input class="input" id="TAJUK MESYUARAT" onblur="mycapitalized()" type="text" placeholder="" name="TAJUK MESYUARAT" required oninvalid="setCustomValidity('Sila isi bahagian ini')" oninput="setCustomValidity('')" />
                    </div>
                </div>
            </div>
            <div class="column is-full">
                <div class="field">
                    <label class="label">TARIKH:<span class="required">*</span></label>
                    <div class="control">
                        <input class="input" id="TARIKH" onblur="mycapitalized()" type="date" name="TARIKH" required oninvalid="setCustomValidity('Sila isi bahagian ini')" oninput="setCustomValidity('')" />
                    </div>
                </div>
            </div>
            <div class="column is-full">
                <div class="field">
                    <label class="label">Waktu:<span class="required">*</span></label>
                    <div class="control" style="display: flex; gap: 1rem;">
                        <div>
                            <label for="timeStart">Waktu Mula:</label>
                            <input 
                                class="input" 
                                id="WAKTU MULA" 
                                onblur="mycapitalized()" 
                                type="time" 
                                name="WAKTU MULA" 
                                required 
                                oninvalid="setCustomValidity('Sila isi bahagian ini')" 
                                oninput="setCustomValidity('')" />
                        </div>
                        <div>
                            <label for="timeEnd">Waktu Selesai:</label>
                            <input 
                                class="input" 
                                id="WAKTU SELESAI" 
                                onblur="mycapitalized()" 
                                type="time" 
                                name="WAKTU SELESAI" 
                                required 
                                oninvalid="setCustomValidity('Sila isi bahagian ini')" 
                                oninput="setCustomValidity('')" />
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="column is-full">
                <div class="field">
                    <label class="label">TUJUAN:<span class="required">*</span></label>
                    <div class="control">
                        <div class="select">
                            <select 
                                name="TUJUAN" 
                                id="TUJUAN" 
                                required 
                                oninvalid="setCustomValidity('Sila isi bahagian ini')" 
                                oninput="setCustomValidity('')"
                            >
                                <option value="" disabled selected>PILIH TUJUAN</option>
                                <option value="TEMPAHAN BILIK MESYUARAT">TEMPAHAN BILIK MESYUARAT</option>
                                <option value="BAWA KELUAR LAPTOP">BAWA KELUAR LAPTOP</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="column is-full">
                <div class="field is-grouped">
                    <div class="control">
                        <button class="button is-primary is-fullwidth" type="submit" id="submit-button">Hantar</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <div
      id="message"
      style="
        display: none;
        margin: 20px;
        font-weight: bold;
        color: green;
        padding: 8px;
        background-color: beige;
        border-radius: 4px;
        border-color: aquamarine;
      "
    ></div>

    <script>
      document.getElementById("form").addEventListener("submit", function (e) {
        e.preventDefault(); // Prevent the default form submission
        document.getElementById("message").textContent = "SEDANG DIHANTAR...................";
        document.getElementById("message").style.display = "block";
        document.getElementById("submit-button").disabled = true;

        // Collect the form data
        var formData = new FormData(this);
        var keyValuePairs = [];
        for (var pair of formData.entries()) {
          keyValuePairs.push(pair[0] + "=" + pair[1]);
        }

        var formDataString = keyValuePairs.join("&");

        // Send a POST request to your Google Apps Script
        fetch(
          "https://script.google.com/macros/s/AKfycbyUUIxcge7Fwtu8asgcaKZTReQJ9jAjb8pXRoRvsNJ5t8OF2eUhSFcxmeh1TLBJvqo/exec",
          {
            redirect: "follow",
            method: "POST",
            body: formDataString,
            headers: {
              "Content-Type": "text/plain;charset=utf-8",
            },
          }
        )
          .then(function (response) {
            // Check if the request was successful
            if (response) {
              return response; // Assuming your script returns JSON response
            } else {
              throw new Error("Failed to submit the form.");
            }
          })
          .then(function (data) {
            // Display a success message
            document.getElementById("message").textContent =
              "BORANG BERJAYA DIHANTAR!";
            document.getElementById("message").style.display = "block";
            document.getElementById("message").style.backgroundColor = "green";
            document.getElementById("message").style.color = "beige";
            document.getElementById("submit-button").disabled = false;
            document.getElementById("form").reset();

            setTimeout(function () {
              document.getElementById("message").textContent = "";
              document.getElementById("message").style.display = "none";
            }, 2600);
          })
          .catch(function (error) {
            // Handle errors, you can display an error message here
            console.error(error);
            document.getElementById("message").textContent =
              "An error occurred while submitting the form.";
            document.getElementById("message").style.display = "block";
          });
      });
    </script>
    <script>
      var date = new Date();
      var tdate = date.getDate();
      var month = date.getMonth() + 1; //4
      if(tdate < 10){
          tdate = '0' +tdate;
      }
      if(month < 10){
          month = "0" + month;
      }
      var year = date.getUTCFullYear();
      var minDate = year + "-" + month + "-" + tdate;
      document.getElementById("TARIKH").setAttribute('min', minDate)
      console.log(minDate);
      </script>
  
      <script>
          function mycapitalized()
          {
          var a = document.getElementById("NAMA PEGAWAI")
          a.value=a.value.toUpperCase();
          var b = document.getElementById("UNIT/ BAHAGIAN")
          b.value=b.value.toUpperCase();
          var c = document.getElementById("TAJUK MESYUARAT")
          c.value=c.value.toUpperCase();        
           }      
      </script>
  
  </body>
</html>
