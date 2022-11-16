function data() {

  return {
    isSideMenuOpen: false,
    toggleSideMenu() {
      this.isSideMenuOpen = !this.isSideMenuOpen
    },
    closeSideMenu() {
      this.isSideMenuOpen = false
    },
    isNotificationsMenuOpen: false,
    toggleNotificationsMenu() {
      this.isNotificationsMenuOpen = !this.isNotificationsMenuOpen
    },
    closeNotificationsMenu() {
      this.isNotificationsMenuOpen = false
    },
    isProfileMenuOpen: false,
    toggleProfileMenu() {
      this.isProfileMenuOpen = !this.isProfileMenuOpen
    },
    closeProfileMenu() {
      this.isProfileMenuOpen = false
    },
    isPagesMenuOpen: false,
    togglePagesMenu() {
      this.isPagesMenuOpen = !this.isPagesMenuOpen
    },
    // Modal
    isModalOpen: false,
    trapCleanup: null,
    openModal() {
      this.isModalOpen = true
      this.trapCleanup = focusTrap(document.querySelector('#modal'))
    },
    closeModal() {
      this.isModalOpen = false
      this.trapCleanup()
    },
    isAlertOpen: false,
    alertMessage: "",
    openAlert(subscriberId) {
      this.isAlertOpen = true

      fetch(`/subscribers/${subscriberId}`, 
        {
          method: 'PUT',
          mode: 'cors',
          headers: {
            'Content-Type': 'application/json'
          },
        },)
        .then(response => response.json())
        .then(data => {
          console.log(data);
        })
        .catch(err => {
          console.log(err)
        })

      setTimeout(() => {
        this.isAlertOpen = false
      }, 4000)
    },
    closeAlert() {
      this.isAlertOpen = false
    },
  }
}
