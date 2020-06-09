import { LightningElement, wire, track, api } from "lwc";

import getopp_stage_List from "@salesforce/apex/accountopportunityfetch.getselectOptions";
import getrecords from "@salesforce/apex/accountopportunityfetch.get_all_records";
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import changeparent from "@salesforce/apex/accountopportunityfetch.getchange";

import { NavigationMixin } from 'lightning/navigation';
import get_opportunity from "@salesforce/apex/accountopportunityfetch.getOpportunities";
import { refreshApex } from '@salesforce/apex';

const columns = [
  {
    label: "Name",
    fieldName: "Name",
    type: "url",
    typeAttributes: { label: { fieldName: "Name" }, target: "_blank" }
  },
  {
    label: "Expected Amount",
    fieldName: "Amount",
    type: "text"
  },
  {
    label: "Closed Date",
    fieldName: "CloseDate",
    type: "date"
  },
  {
    label: "Lead Source",
    fieldName: "LeadSource",
    type: "text"
  },
  {
    label: "Probability",
    fieldName: "Probability",
    type: "text"
  },
  {
    label: "Stage",
    fieldName: "StageName",
    type: "text"
  }
];

export default class accountopportunity extends NavigationMixin(LightningElement) {
  @api recordId; //this captures AccountId which is passed from Parent Component
  @track error; //this holds errors
  @track selected;
  @track items = []; //this holds the array for records with value & label
  @track myjson; // = "JSON Data will be Here!!";
  @track value = ""; //this displays selected value of combo box
  @track all_opp = [];
  @track selected_opp = [];
  @track new_selected = [];
  @track searchData;
  @track tosearch = "";
  @track to_send_id = "";
  @track visible = false;
  @track columns = columns;
  wiredAccountResults;



  @wire(getopp_stage_List)
  wired_opp_stages({ error, data }) {
    if (data) {
      for (let i = 0; i < data.length; i++) {
        this.items = [...this.items, { value: data[i], label: data[i] }];
      }
      this.error = undefined;
    } else if (error) {
      alert(error);
      this.error = error;
      this.items = undefined;
    }
  }

  @wire(getrecords, { recordId: "$recordId" })
  wiredjsondata({ error, data }) {
    if (data) {
      this.myjson = JSON.parse(data);
      this.format_json;
      this.error = undefined;
    } else if (error) {
      this.error = error;
      alert(error);
      this.myjson = undefined;
    }
  }

  @wire(get_opportunity, { recordId: "$recordId" })
  wired_opp_records(result) {
    this.wiredAccountResults = result;

    if (result.data) {
      this.searchData = result.data;
    } else if (result.error) {
      alert(error);
    }
  }

  get statusOptions() {
    return this.items;
  }

  get get_opportunities() {
    return this.all_opp ? this.all_opp : "";
  }

  get get_opportunity_record() {
    return this.searchData ? this.searchData : "";
  }

  ChangeOppStage(event) {
    this.visible = true;
    this.selected = event.detail.value;

    let all = this.myjson;
    let sel = [];
    let unsel = [];
    try {
      let acc_to_pick = this.new_selected[this.selected];
      if (
        acc_to_pick != null ||
        acc_to_pick != "" ||
        acc_to_pick != undefined
      ) {
        let res2 = acc_to_pick.toString().split(",");
        this.selected_opp = res2;
      } else {
        let allselected = all["selected"];
        let opp_selected = allselected[selected];

        for (let i = 0; i < opp_selected.length; i++) {
          let rec = opp_selected[i];
          var ald = this.tosearch.toString();
          this.tosearch = ald + " " + rec.Id;
          sel.push(rec.Id);
        }

        this.selected_opp = sel;
      }
    } catch (err) {
      let allselected = all["selected"];
      let opp_selected = allselected[this.selected];

      for (let i = 0; i < opp_selected.length; i++) {
        let rec = opp_selected[i];
        var ald = this.tosearch;
        this.tosearch = ald + " " + rec.Id;
        sel.push(rec.Id);
      }

      this.selected_opp = sel;
    }

    let allunselected = all["unselected"];
    let unselected = allunselected[this.selected];

    for (let i = 0; i < unselected.length; i++) {
      let rec = unselected[i];
      unsel.push({
        label: rec.Name,
        value: rec.Id
      });
    }

    this.all_opp = unsel;
  }

  dual_value_change(e) {
    try {
      let selectedOptionValue = e.detail.value;

      this.tosearch = selectedOptionValue.toString();
      let pick = this.selected;

      let res = selectedOptionValue.toString().split(",");

      let data = this.new_selected;

      if (data == null) {
        let obj = {};
        obj[pick] = res + "";
        this.new_selected = obj;
      } else {
        try {
          let data2 = data[pick];

          if (data2 != undefined || data2 != null) {
            data[pick] = res + "";
            this.new_selected = data;
          } else {
            data[pick] = res + "";
            this.new_selected = data;
          }
        } catch (err) {
          let obj = {};
          obj[pick] = res + "";
          data[pick] = res + "";
          this.new_selected = data;
        }
      }
    } catch (err) {
      alert("error on swap  " + err.message);
    }
  }

  search_opp_handle(event) {
    let to = event.target.value;
    let unsel = [];
    let pick = this.selected;
    let all = this.myjson;
    let allunselected = all["unselected"];
    let unselected = allunselected[pick];

    for (let i = 0; i < unselected.length; i++) {
      let rec = unselected[i];

      if (rec.Name.includes(to) || this.tosearch.toString().includes(rec.Id))
        unsel.push({
          label: rec.Name,
          value: rec.Id
        });
    }

    this.all_opp = unsel;
  }


  changeparant() {
    let lis = [
      "Prospecting",
      "Qualification",
      "Needs Analysis",
      "Value Proposition",
      "Id. Decision Makers",
      "Perception Analysis",
      "Proposal/Price Quote",
      "Negotiation/Review",
      "Closed Won",
      "Closed Lost"
    ];
    this.to_send_id = "";
    let all = this.myjson;
    let allselected = all["selected"];
    for (let i = 0; i < lis.length; i++) {
      try {
        this.to_send_id += this.new_selected[lis[i]].toString() + ",";
      } catch (error) {
        let opp_selected = allselected[lis[i]];

        for (let i = 0; i < opp_selected.length; i++) {
          let rec = opp_selected[i];
          this.to_send_id += rec.Id + ",";
        }
      }
    }

    changeparent({
      tochange: this.to_send_id.toString(),
      recordId: this.recordId
    })
      .then((result) => {
        if (result == "Done") {
          this.dispatchEvent(
            new ShowToastEvent({
              title: 'Success',
              message: 'Opportunity Updated',
              variant: 'success'
            })
          );

          return refreshApex(this.wiredAccountResults);

          // location.reload();
        } else {
          alert("Parent Change Failed");
        }
      })
      .catch((error) => {
        this.error = error;
        alert("Error : " + error);
      });
  }
}