### multiple monitrs with i3 ###
xrandr --output HDMI1 --auto --right-of eDP1

### Sound ###
amixer
pavucontrol


### mount ###
    sudo umount -l /mnt/dust # In case of connection lost resulting in bad mount
    sudo fusermount -uz /mnt

### getting tables from pdf
    pdftotext -layout NAME_OF_PDF.pdf

> pip install tabula-py\
    from tabula import read_pdf\
    df = read_pdf("tables.pdf", multiple_tables=True)\

### find/grep usage
find . -name "*.py" | xargs grep HFhists

### Cpp nice functions

    //**************************************
    // function replace all occurence of a subtring inside a string
    //**************************************
    void replace(string& str, const string& from, const string& to){
        size_t index;
        while (true) {
        index = str.find(from);
        if (index == string::npos) break;   /* Locate the substring to replace. */
        str.replace(index, from.length(), to);  /* Make the replacement. */
        index += from.length(); /* Advance index forward so the next iteration doesn't pick it up as well. */
        }
    }

        //*****************************
    //function to check whether a substring is there in a string
    //*****************************
    bool inString(string str, string checkStr){
        if(str.find(checkStr) != string::npos)
        return true;
        else
        return false;
    }

    //****************************************
    //function to check whether an element is there in a vector or not
    //****************************************
    bool inVector(vector<string> &v, string &item){
        vector<string>::iterator it = find(v.begin(), v.end(), item);
        if(it==v.end()){
        return false;
        }
        else return true;
    }


    //splitting strings
    vector<string> Tools::getStringSegments(string input, char delim)
    {
        vector<string> elems;
        stringstream ss(input);
        string item;
        while (getline(ss, item, delim)) {
            elems.push_back(item);
        }
        return elems;
    }

