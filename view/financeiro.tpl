{include file="view/header.tpl"}
{include file="view/menu.tpl"}

<div id="tabela">
    <form name="form_financeiro" method="POST" enctype="multipart/form-data">

        <div id="menuTratamento">
            <p>Financeiro</p>

            <a href="Financeiro.php?pag=true" class="btn btnAction bradius lancaPagamento" data-fancybox-type="iframe">Lançar Pagamento</a>
            <a href="Financeiro.php?des=true" class="btn btnAction bradius lancaDespesa" data-fancybox-type="iframe">Lançar Despesa</a>
            <label for="fromData">Filtra de</label>
            <input type="text" class="txt bradius" name="fromData" id="fromData" placeholder="__/__/____" />
            <label for="toData">até</label>
            <input type="text" class="txt bradius" name="toData" id="toData" placeholder="__/__/____" />
            <input type="image" src="css/image/search-icon.png" value="submit" width="20" height="20"/>
            <input type="image" src="css/image/printer-icon.png" width="20" height="20" value="imprimir" alt="Imprimir" title="Imprimir" onclick="" />
            <label id="filtrolabel" for="filtro">Filtrar por período:</label>
            <select class="txt bradius" name="filtro" id="filtro">
                <option value="" selected="selected">[Selecione]</option>
                <option value="1">Diário</option>
                <option value="2">Semanal</option>
                <option value="3">Mensal</option>
                <option value="4">Anual</option>
            </select>
        </div>

        <div id="separator">
            <span>{$mes}</span>
        </div>

        <div id="financeiro">

            <div id="balanco">
                <div class="bradius" id="balanco-geral">
                    <div id="balanco-geral-inner">
                        <label id="label-balanco-geral">Balanço Geral</label>
                    </div>
                    <hr />
                    <span id="span-entrada" for="labelentradas">Entrada: <label id="label-entrada" class="positivo">R$ {$entrada}</label></span><br />
                    <span id="span-saida" for="labelsaidas">Saídas: <label id="label-saida" class="negativo">R$ {$saida}</label></span>
                    <hr />
                    <span id="span-total" for="total">Saldo: 
                        <label id="label-total" class="{if ($balancogeral < 0)}negativo{else}positivo{/if}">
                            R$ {$balancogeral}
                        </label>
                    </span>
                </div><!-- balanco-geral -->

                <div class="bradius" id="balanco-mes">
                    <div id="balanco-mes-inner">
                        <label id="label-balanco-mes">Entradas e saídas deste mês</label>
                    </div>
                    <hr />
                    <span id="span-entrada" for="labelentradas">Entrada: <label id="label-entrada" class="positivo">R$ 12.720,00</label></span><br />
                    <span id="span-saida" for="labelsaidas">Saídas: <label id="label-saida" class="negativo">R$ 2.399,70</label></span>
                    <hr />
                    <span id="span-total" for="total">Saldo: 
                        <label id="label-total" class="{if ($totalMes < 0)}negativo{else}positivo{/if}">
                            R$ {$totalMes}
                        </label>
                    </span>
                </div><!-- balanco-mes -->
            </div><!-- balanco -->

            <div id="movimentacao">
                <div id="movimentacao-select-categoria">
                    <label id="labelcategoria" for="categoria">Filtrar por categoria: </label>
                    <select class="txt bradius" name="categorias" id="categorias">
                        <option value="" selected="selected">Tudo</option>
                        <option value="">Banco</option>
                        <option value="">Caixa</option>
                        <option value="">Cartão</option>
                        <option value="">Plano Dentário</option>
                    </select>
                </div>
                <div id="movimentacao-mes">
                    <label for="movimentos">Movimentos deste mês</label>
                </div>
                <table>
                    <thead>
                        <tr id="rotulo">
                            <td id="movimentacao-data">Data</td>
                            <td id="movimentacao-descricao">Descrição</td>
                            <td id="movimentacao-categoria">Forma de Pagamento</td>
                            <td id="movimentacao-valor">Valor - R$</td>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach from=$dados item=linha}
                            <tr>
                                <td id="movimentacao-data">{$linha.DtPagamento}</td>
                                <td id="movimentacao-descricao">
                                    {if ($linha.idTipoMovimentacao == 1)}
                                        Pagamento recebido do paciente <em>{$linha.paciente}</em>
                                    {elseif ($linha.idTipoMovimentacao == 2)}
                                        {$linha.descricao}
                                    {/if}
                                </td>
                                <td id="movimentacao-categoria">{$linha.categoria}</td>
                                <td id="movimentacao-valor">{$linha.valor}</td>
                            </tr>
                        {/foreach}
                    </tbody>
                    <tfoot>
                        <tr id="movimentacao-tr-total">
                            <td colspan="3" id="movimentacao-total">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TOTAL</td>
                            <td id="movimentacao-valor-total" class="{if ($totalMes < 0)}negativo{else}positivo{/if}">{$totalMes}</td>
                        </tr>
                    </tfoot>
                </table>

            </div><!-- movimentacao -->

        </div><!-- financeiro -->

    </form>
</div><!-- tabela -->

{include file="view/footer.tpl"}