import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  abrirModalPasta() {
    var meuModal = new bootstrap.Modal(document.getElementById('modalNovaPasta'));
    meuModal.show();
  }

  abrirModalArquivo() {
    var meuModal = new bootstrap.Modal(document.getElementById('modalNovoArquivo'));
    meuModal.show();
  }
}
