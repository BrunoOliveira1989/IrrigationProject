(function () {
    let zona = document.getElementById("id_zona");
    let jardim = document.getElementById("jardim");
    jardim.addEventListener("change", async function() {
      var jardimValor = jardim.value;
      const response = await fetch("select_zona.php?id=" + jardimValor);
  
      if (response.ok) {
        const htmlToAdd = await response.text();
        zona.innerHTML = htmlToAdd;
        // zona.insertAdjacentHTML("beforeend", htmlToAdd);
      }
    });
  })();