function checkDay(days) {
    /* Check if there is any overlap in the list of blocked and
    friction days.
    */
    let bdays = days[0].map(Number)
    let fdays = days[1].map(Number)
    
    if (bdays.includes(day)){
        alert("No LLMs today!")
        history.back()
    } else if (fdays.includes(day)) {
        if (window.confirm("Are you sure you need the LLM for this?") == false) {
            history.back();
        } 
    }
}


let blocked = browser.storage.sync
  .get("blocked")
let friction = browser.storage.sync.get("friction")

const d = new Date();
let day = d.getDay();

Promise.all([blocked, friction])
    .then(value => {
        return [value[0].blocked.split(" "), value[1].friction.split(" ")]
    })
    .then(checkDay)
