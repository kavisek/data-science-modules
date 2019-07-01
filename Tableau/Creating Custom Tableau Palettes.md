# <center> Tableau Custom Palettes </center>

When you install Tableau Desktop on your machine. The machine will create a directory called "My Tableau Repository" to store all your Tableau data within. This directory also contains a preference file that allows you to upload customre preference to your Tableau Desktop Editor.

Within this preference file we can upload customer color palettes that correlated with the branding of your company and/or clients. You color palettes can contain as many colors as you like, but will need to be added to the preference file at HTML code.

#### Color Paletee HTML Sample

The following is the HTML code for the color palette called "My Categorical Palette".

```html
<color-palette name="My Categorical Palette" type="regular" >
<color>#feebe2</color>
<color>#fcc5c0</color>
<color>#fa9fb5</color>
<color>#f768a1</color>
<color>#dd3497</color>
<color>#ae017e</color>
<color>#7a0177</color>
</color-palette>
```

### Updated Preference File

After adding creating your converting your custom palette values into HTML code, you can add it to your preference file. The preference file will look something like this afterwards.

```html
<?xml version='1.0'?>

<workbook>
  <preferences>
    <color-palette name="My Categorical Palette" type="regular" >
    <color>#feebe2</color>
    <color>#fcc5c0</color>
    <color>#fa9fb5</color>
    <color>#f768a1</color>
    <color>#dd3497</color>
    <color>#ae017e</color>
    <color>#7a0177</color>
    </color-palette>
  </preferences>
</workbook>

```

### Multiple Color Palettes in Preferences

You can also add Multiple color palettes into Tableau by adding them to your preference file. An exmaple of this can be found in the preference file code below.

```html
<?xml version='1.0'?>

<workbook>
  <preferences>
    <color-palette name="My Categorical Palette" type="regular" >
    <color>#feebe2</color>
    <color>#fcc5c0</color>
    <color>#fa9fb5</color>
    <color>#f768a1</color>
    <color>#dd3497</color>
    <color>#ae017e</color>
    <color>#7a0177</color>
    </color-palette>
    <color-palette name="My Categorical Palette 2" type="regular" >
    <color>#feebe2</color>
    <color>#fcc5c0</color>
    <color>#fa9fb5</color>
    <color>#f768a1</color>
    <color>#dd3497</color>
    <color>#ae017e</color>
    <color>#7a0177</color>
    </color-palette>
  </preferences>
</workbook>
```

### References

- https://onlinehelp.tableau.com/current/pro/desktop/en-gb/formatting_create_custom_colors.htm
