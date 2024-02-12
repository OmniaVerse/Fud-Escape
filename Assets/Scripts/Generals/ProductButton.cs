using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ProductButton : MonoBehaviour {
    public string Name; //Ten trung voi ten co trong Name list product IAP
    string productID;
    public Text title, description, price, modification, textButton;
    public Image image, iconSale;

    void OnEnable()
    {
        int iLang = Modules.indexLanguage;
        title.font = AllLanguages.listFontLangA[iLang];
        description.font = AllLanguages.listFontLangB[iLang];
        textButton.font = AllLanguages.listFontLangA[iLang];
        if (Name != "") UpdateData(Name);
    }

    void UpdateData(string productName)
    {
        
    }

    

    
}
