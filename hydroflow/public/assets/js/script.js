(function () {
  let contador = 2;

  document.querySelector(".btn-add").addEventListener("click", function () {
    var htmlToAdd = `
          <h2 class="title secundario"><i class="ph-bold ph-flag"></i>Zona ${contador}</h2>
          <div class="form-group">
              <div class="input-field duplo-select">
                  <label for="nome_zona">Nome da Zona</label>
                  <div class="duplo-select">
                      <select class="input" name="nome_zona_let${contador}" id="nome_zona">
                          <option value="">A</option>
                          <option value="">B</option>
                          <option value="">C</option>
                          <option value="">D</option>
                          <option value="">E</option>
                          <option value="">F</option>
                          <option value="">G</option>
                          <option value="">H</option>
                          <option value="">I</option>
                          <option value="">J</option>
                      </select>
                      <select class="input" name="nome_zona_num${contador}" id="nome_zona">
                          <option value="">1</option>
                          <option value="">2</option>
                          <option value="">3</option>
                          <option value="">4</option>
                          <option value="">5</option>
                          <option value="">6</option>
                          <option value="">7</option>
                          <option value="">8</option>
                          <option value="">9</option>
                          <option value="">10</option>
                      </select>
                  </div>
              </div>
              <div class="input-field flex-5">
                  <label for="tipo_planta">Tipo de Planta</label>
                  <select class="input" name="tipo_planta${contador}" id="tipo_planta">
                  </select>
                  <div class="invalid-feedback">
                  </div>
              </div>
              <div class="input-field flex-5">
                  <label for="tipo_irrigacao">Tipo Irrigação</label>
                  <select class="input" name="tipo_irrigacao${contador}" id="tipo_irrigacao">
                  </select>
                  <div class="invalid-feedback">
                  </div>
              </div>
          </div>
          <div class="form-group">
              <div class="input-field">
                  <label for="descricao_jardim">Descrição</label>
                  <textarea class="input textarea" name="descricao_jardim${contador}" id="descricao_jardim" cols="30" rows="10"></textarea>
              </div>
          </div>
      `;

    // Adicionar o HTML antes do botão "Adicionar"
    this.insertAdjacentHTML("beforebegin", htmlToAdd);

    contador++;
  });
})();
