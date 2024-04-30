<main class="main">
    <?php
    renderTitle(
        "Dispositivos",
        "Gerencie ou adicione novos dispositivos de irrigação",
        "circuitry"
    );

    include(TEMPLATE_PATH . "/messages.php");
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
                <div class="table-cell header id">
                    Código
                    <a href="?filtro=id<?= $_GET['filtro'] == 'id' ? $_GET['ordem'] ? '' : '&ordem=DESC' : '' ?>" class="sort-btn"><i class="ph-bold ph-arrows-down-up"></i></a>
                </div>
                <div class="table-cell header">
                    Nome
                    <a href="?filtro=nome_dispositivo<?= $_GET['filtro'] == 'nome_dispositivo' ? $_GET['ordem'] ? '' : '&ordem=DESC' : '' ?>" class="sort-btn"><i class="ph-bold ph-arrows-down-up"></i></a>
                </div>
                <div class="table-cell header">
                    Modelo
                    <button class="sort-btn"><i class="ph-bold ph-arrows-down-up"></i></button>
                </div>
                <div class="table-cell header">
                    Tipo
                    <button class="sort-btn"><i class="ph-bold ph-arrows-down-up"></i></button>
                </div>
                <div class="table-cell header">
                    Jardim
                    <button class="sort-btn"><i class="ph-bold ph-arrows-down-up"></i></button>
                </div>
                <div class="table-cell header">
                    Área
                    <button class="sort-btn"><i class="ph-bold ph-arrows-down-up"></i></button>
                </div>
            </div>
            <?php foreach($dispositivos as $dispositivo) :?>
            <a href="cadastro_dispositivo.php?update=<?= $dispositivo->id ?>" class="table-row">
                <div class="table-cell id"><span class="item"><?= str_pad($dispositivo->id, 4, '0' , STR_PAD_LEFT) ?></span></div>
                <div class="table-cell"><?= $dispositivo->nome_dispositivo ?></div>
                <div class="table-cell"><?= $dispositivo->modelo_dispositivo ?></div>
                <div class="table-cell"><?= $dispositivo->id_tipo_dispositivo ?></div>
                <div class="table-cell">
                    <?php foreach ($zonas as $zona) {
                            foreach($jardins as $jardim){
                                echo $jardim->id == $zona->id_jardim && $zona->id == $dispositivo->id_zona ? $jardim->nome_jardim : "";
                            }
                        }
                    ?>
                </div>
                <div class="table-cell">
                <?php foreach ($zonas as $zona) : ?>
                        <?= $zona->id == $dispositivo->id_zona ? "<span class='item'>{$zona->nome_zona}</span>" : "" ?>
                    <?php endforeach ?>
                </div>
            </a>
            <?php endforeach ?>
        </div>
        <a href="cadastro_dispositivo.php" class="btn-new"><i class="icon ph-bold ph-plus-circle"></i>Novo</a>
    </div>
</main>