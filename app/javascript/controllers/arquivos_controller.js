import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { id: String }

  abrirModalPasta() {
    var meuModal = new bootstrap.Modal(document.getElementById('modalNovaPasta'));
    meuModal.show();
  }

  abrirModalArquivo() {
    var meuModal = new bootstrap.Modal(document.getElementById('modalNovoArquivo'));
    meuModal.show();
  }

  async abrirArquivo() {
    const res = await fetch(`/midias/${this.idValue}.json`, {
      method: 'GET',
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      }
    })

    const midia = JSON.parse(await res.text())
    const bodyImage = document.querySelector(`[data-js='body-image']`)

    if (midia.tipo.includes("image")) {
      bodyImage.innerHTML = `
        <img src="${midia.arquivo}" class="img-fluid w-100">
      `
    } else if (midia.tipo.includes("pdf")) {
      bodyImage.innerHTML = `
        <iframe src="${midia.arquivo}" style="width: 100%; height: 70vh;"></iframe>
      `
    } else {
      window.open(midia.arquivo, '_blank');
      return
    }

    bodyImage.innerHTML += `
      <a href="${midia.arquivo}" target="_blank" class="btn btn-primary btn-sm mt-3">Download</a>
    `

    var meuModal = new bootstrap.Modal(document.getElementById('modalDataImage'));
    meuModal.show();
  }
}
