class formWizard {
  constructor() {
    this.activeStep = 1;
    this.attachListeners();
    this.showPrevNextSubmit();
  }

  getSectionTitles() {
    const sectionsTitles = document.querySelectorAll(".sectionTitle");
    return sectionsTitles;
  }

  getSectionsLength() {
    const sectionsDiv = document.getElementById("sectionsDiv");
    console.log("eee");
    console.log(sectionsDiv);
    const sectionLength = sectionsDiv.dataset.sectionlength;
    console.log("the one");
    console.log(sectionLength);
    return sectionLength;
  }

  attachListeners() {
    const btn = document.getElementById("next")
    if (btn) {
      document.getElementById("next").addEventListener("click", this.nextTab.bind(this));
      document.getElementById("previous").addEventListener("click", this.previousTab.bind(this));
    }
  }

  inactivateAllTiles() {
    document.querySelectorAll('.sectionTitle').forEach(tile => {
      tile.classList.remove('active')
    })
  }

  hideAllSteps() {
    var steps = document.querySelectorAll("div.form-step");
    steps.forEach((step) => {
      step.hidden = true;
    });
    this.inactivateAllTiles()
  }

  nextTab() {
    this.activeStep += 1;
    this.hideAllSteps();
    document.getElementById(`step-${this.activeStep}`).hidden = false;
    document.getElementById(`tile-${this.activeStep}`).classList.add('active')
    this.showPrevNextSubmit();
  }

  previousTab() {
    this.activeStep -= 1;
    this.hideAllSteps();
    document.getElementById(`step-${this.activeStep}`).hidden = false;
    document.getElementById(`tile-${this.activeStep}`).classList.add('active')
    this.showPrevNextSubmit()
  }

  get totalLength() {
    return this.getSectionTitles().length;
  }

  showPrevNextSubmit() {
    // BEGINNING STATE
    if (this.activeStep <= 1) {
      document.querySelector("#previous").style.display = 'none';
    } else {
      document.querySelector("#previous").style.display = 'inline';
    }

    if (this.activeStep >= this.totalLength) {
      document.querySelector("#next").style.display = 'none';
    } else {
      document.querySelector("#next").style.display = 'inline';
    }
    if (this.activeStep >= this.totalLength) {
      document.querySelector("#submit").style.display = 'inline';
    } else {
      document.querySelector("#submit").style.display = 'none';
    }
  }
}

const editSubmissio = document.querySelector(".edit_submissio");

if (editSubmissio) {
  new formWizard();
}


