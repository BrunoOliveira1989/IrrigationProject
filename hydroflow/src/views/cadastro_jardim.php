<main class="main">
    <?php
        renderTitle(
            "Jardins",
            "Cadastre novos jardins e suas zonas",
            "potted-plant"
        );

        include (TEMPLATE_PATH . "/messages.php")
    ?>
    <div class="content">
        <form action="#" method="post" class="register" id="register">
            <div class="form-group">
                <div class="input-field flex-10">
                    <label for="nome_jardim">Nome do Jardim</label>
                    <input class="input" type="text" name="nome_jardim" id="nome_jardim"
                        placeholder="Digite o nome do jardim" />
                    <div class="invalid-feedback"></div>
                </div>
                <div class="input-field">
                    <label for="tamanho">Área (m²)</label>
                    <input class="input" type="text" name="tamanho" id="tamanho"
                        placeholder="Digite o tamanho do jardim" />
                    <div class="invalid-feedback"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="input-field">
                    <label for="descricao_jardim">Descrição</label>
                    <textarea class="input textarea" name="descricao_jardim" id="descricao_jardim" cols="30"
                        rows="10"></textarea>
                </div>
            </div>
            <div class="form-group">
                <div class="input-field">
                    <label for="cep">CEP</label>
                    <input class="input invalid" type="text" name="cep" id="cep" placeholder="Digite o cep" />
                    <div class="invalid-feedback"></div>
                </div>
                <div class="input-field flex-10">
                    <label for="logradouro">Endereço</label>
                    <input class="input invalid" type="text" name="logradouro" id="logradouro"
                        placeholder="Digite o Endereço" />
                    <div class="invalid-feedback"></div>
                </div>
                <div class="input-field">
                    <label for="numero">Nº</label>
                    <input class="input invalid" type="number" min="0" max="5000" name="numero" id="numero"
                        placeholder="Digite o Numero" />
                    <div class="invalid-feedback"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="input-field flex-3">
                    <label for="bairro">Bairro</label>
                    <input class="input invalid" type="text" name="bairro" id="bairro" placeholder="Digite o Bairro" />
                    <div class="invalid-feedback"></div>
                </div>
                <div class="input-field flex-5">
                    <label for="cidade">Cidade</label>
                    <input class="input invalid" type="text" name="cidade" id="cidade" placeholder="Digite a cidade" />
                    <div class="invalid-feedback"></div>
                </div>
                <div class="input-field">
                    <label for="estado">Estado</label>
                    <input class="input invalid" type="number" min="0" max="5000" name="estado" id="estado"
                        placeholder="Digite o Estado" />
                    <div class="invalid-feedback"></div>
                </div>
            </div>
            <h2 class="title secundario"><i class="ph-bold ph-flag"></i>Zona</h2>
            <div class="form-group">
                <div class="input-field duplo-select">
                    <label for="nome_zona">Nome da Zona</label>
                    <div class="duplo-select">
                        <select class="input" name="nome_zona" id="nome_zona">
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
                        <select class="input" name="nome_zona" id="nome_zona">
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
                    <select class="input" name="tipo_planta" id="tipo_planta"></select>
                    <div class="invalid-feedback"></div>
                </div>
                <div class="input-field flex-5">
                    <label for="tipo_irrigacao">Tipo Irrigação</label>
                    <select class="input" name="tipo_irrigacao" id="tipo_irrigacao"></select>
                    <div class="invalid-feedback"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="input-field">
                    <label for="descricao_jardim">Descrição</label>
                    <textarea class="input textarea" name="descricao_jardim" id="descricao_jardim" cols="30"
                        rows="10"></textarea>
                </div>
            </div>
            <div class="btn-add">Adicionar Zona</div>
            <input type="hidden" name="contador" value="1">
            <button class="btn-register">
                <i class="ph-bold ph-check-fat"></i>Cadastrar
            </button>
        </form>
    </div>
</main>