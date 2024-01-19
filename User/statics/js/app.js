$(document).ready(function () {
    //Owl
    $('.hero-slider').owlCarousel({
        loop: true,
        margin: 0,
        items: 1,
        dots: false,
        navText: ['PREV', 'NEXT'],
        smartSpeed: 1000,
        autoplay: true,
        autoplayTimeout: 7000,
        responsive: {
            0: {
                nav: false,
            },
            768: {
                nav: true,
            }
        }
    })

    $('#projects-slider').owlCarousel({
        loop: true,
        nav: false,
        items: 2,
        dots: true,
        smartSpeed: 600,
        center: true,
        autoplay: true,
        autoplayTimeout: 4000,
        responsive: {
            0: {
                items: 1
            },
            768: {
                items: 2,
                margin: 8,
            }
        }
    })

    $('.reviews-slider').owlCarousel({
        loop: true,
        nav: false,
        dots: true,
        smartSpeed: 900,
        items: 1,
        margin: 24,
        autoplay: true,
        autoplayTimeout: 4000,
    })
});

document.addEventListener('DOMContentLoaded', () => {
    "use strict";
  
    /**
     * Porfolio isotope and filter
     */
    let portfolionIsotope = document.querySelector('.portfolio-isotope');
  
    if (portfolionIsotope) {
  
      let portfolioFilter = portfolionIsotope.getAttribute('data-portfolio-filter') ? portfolionIsotope.getAttribute('data-portfolio-filter') : '*';
      let portfolioLayout = portfolionIsotope.getAttribute('data-portfolio-layout') ? portfolionIsotope.getAttribute('data-portfolio-layout') : 'masonry';
      let portfolioSort = portfolionIsotope.getAttribute('data-portfolio-sort') ? portfolionIsotope.getAttribute('data-portfolio-sort') : 'original-order';
  
      window.addEventListener('load', () => {
        let portfolioIsotope = new Isotope(document.querySelector('.portfolio-container'), {
          itemSelector: '.portfolio-item',
          layoutMode: portfolioLayout,
          filter: portfolioFilter,
          sortBy: portfolioSort
        });
  
        let menuFilters = document.querySelectorAll('.portfolio-isotope .portfolio-flters li');
        menuFilters.forEach(function(el) {
          el.addEventListener('click', function() {
            document.querySelector('.portfolio-isotope .portfolio-flters .filter-active').classList.remove('filter-active');
            this.classList.add('filter-active');
            portfolioIsotope.arrange({
              filter: this.getAttribute('data-filter')
            });
            if (typeof aos_init === 'function') {
              aos_init();
            }
          }, false);
        });
  
      });
  
    }
  
});

let subMenu = document.getElementById("subMenu");

function toggleMenu(){
  subMenu.classList.toggle("open-menu");
}


var form = document.getElementById("myForm"),
  nomCmd = document.getElementById("name"),
  resto = document.getElementById("resto"),
  date = document.getElementById("Cdate"),
  cdstatus = document.getElementById("status"),
  submitBtn = document.querySelector(".submit"),
  userInfo = document.getElementById("data"),
  modal = document.getElementById("cmdForm"),
  modalTitle = document.querySelector("#cmdForm .modal-title"),
  newUserBtn = document.querySelector(".newCmd")


let getData = localStorage.getItem('cmdElt') ? JSON.parse(localStorage.getItem('cmdElt')) : []

let isEdit = false, editId
showInfo()

newUserBtn.addEventListener('click', ()=> {
  submitBtn.innerText = 'Submit',
  modalTitle.innerText = "Fill the Form"
  isEdit = false
  form.reset()
})



function showInfo(){
  document.querySelectorAll('.cmdDetails').forEach(info => info.remove())
  getData.forEach((element, index) => {
      let createElement = `<tr class="cmdDetails">
          <td>${index+1}</td>
          <td>${element.cmdName}</td>
          <td>${element.cmdResto}</td>
          <td>${element.startDate}</td>
          <td>${element.cmdStatus}</td>


          <td>
              <button class="btn btn-success" onclick="readInfo('${element.cmdName}', '${element.cmdresto}', '${element.startDate}', '${element.cmdStatus}')" data-bs-toggle="modal" data-bs-target="#readData"><i class="bi bi-eye"></i></button>

              <button class="btn btn-primary" onclick="editInfo(${index}, '${element.cmdName}', '${element.cmdresto}', '${element.startDate}', '${element.cmdStatus}')" data-bs-toggle="modal" data-bs-target="#userForm"><i class="bi bi-pencil-square"></i></button>

              <button class="btn btn-danger" onclick="deleteInfo(${index})"><i class="bi bi-trash"></i></button>
                          
          </td>
      </tr>`

      userInfo.innerHTML += createElement
  })
}
showInfo()


function readInfo(name, resto, date, etat){
  document.querySelector('#showName').value = name,
  document.querySelector("#showResto").value = resto,
  document.querySelector("#showsDate").value = date,
  document.querySelector("#showStatus").value = etat
}


function editInfo(name, resto, date, etat){
  isEdit = true
  editId = index
  nomCmd.value = name
  resto.value = resto
  date.value = date
  cdstatus.value = etat
  submitBtn.innerText = "Update"
  modalTitle.innerText = "Update The Form"
}


function deleteInfo(index){
    if(confirm("Are you sure want to delete?")){
        getData.splice(index, 1)
        localStorage.setItem("cmdElt", JSON.stringify(getData))
        showInfo()
    }
}


form.addEventListener('submit', (e)=> {
  e.preventDefault()

  if (nomCmd && resto && date && cdstatus) {
    const information = {
      cmdName: nomCmd.value,
      cmdResto: resto.value,
      startDate: date.value,
      cmdStatus: cdstatus.value 
    }

    if(!isEdit){
      getData.push(information)
    }
    else{
      isEdit = false
      getData[editId] = information
    }
    
  } else {
    console.error("One or more form elements are not found in the DOM.");
  }

  localStorage.setItem('cmdElt', JSON.stringify(getData))

  submitBtn.innerText = "Submit"
  modalTitle.innerHTML = "Fill The Form"

  showInfo()

  form.reset()


  // modal.style.display = "none"
  // document.querySelector(".modal-backdrop").remove()
})