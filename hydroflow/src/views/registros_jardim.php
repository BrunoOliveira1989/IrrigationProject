<main class="main">
    <?php
    renderTitle(
        "Jardins",
        "Gerencie ou adicione novos jardins e suas zonas",
        "potted-plant"
    );
    ?>
    <div class="content">
        <form action="" method="get" class="search">
            <select name="" id="" class="search-filter">
                <option value="*">Filtro</option>
                <option value="*">Zona</option>
                <option value="*">Jardim</option>
                <option value="*">Plantas</option>
            </select>
            <input type="text" class="search-input" name="search" id="search" placeholder="Pesquisar">
            <button type="submit" class="btn-search"><i class="icon ph-bold ph-magnifying-glass"></i></button>
        </form>
        <div class="table">
            <div class="table-header">
                <div class="table-cell header">
                    Código
                    <button class="sort-btn"><i class="ph-bold ph-arrows-down-up"></i></button>
                </div>
                <div class="table-cell header">
                    Nome
                    <button class="sort-btn"><i class="ph-bold ph-arrows-down-up"></i></button>
                </div>
                <div class="table-cell header">
                    Endereço
                    <button class="sort-btn"><i class="ph-bold ph-arrows-down-up"></i></button>
                </div>
                <div class="table-cell header">
                    CEP
                    <button class="sort-btn"><i class="ph-bold ph-arrows-down-up"></i></button>
                </div>
                <div class="table-cell header">
                    Tamanho
                    <button class="sort-btn"><i class="ph-bold ph-arrows-down-up"></i></button>
                </div>
                <!-- <div class="table-cell header">
                    Funcionário
                    <button class="sort-btn"><i class="ph-bold ph-arrows-down-up"></i></button>
                </div> -->
            </div>
            <?php foreach($jardins as $jardim) :?>
            <div class="table-row">
                <div class="table-cell"><?= $jardim->id ?></div>
                <div class="table-cell"><?= $jardim->nome_jardim ?></div>
                <div class="table-cell"><?= $jardim->logradouro . " N° " .  $jardim->numero ?></div>
                <div class="table-cell"><?= $jardim->cep ?></div>
                <div class="table-cell"><?= $jardim->tamanho?> m²</div>
            </div>
            <?php endforeach ?>
        </div>
        <a href="cadastro_jardim.php" class="btn-new"><i class="icon ph-bold ph-plus-circle"></i>Novo</a>
    </div>
</main>