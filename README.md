# Mata Foundry™ Digital Assets

A free, open-source collection of Geometry Node-based VFX tools for Blender. Drag-and-drop camera rigs, cloth utilities, hair effects, rain simulations, and more directly into your scene from Blender's Asset Browser.

## Included Assets

| Asset | Type | Description |
|---|---|---|
| Camera Alexa 65 Anamorphic | Camera | ARRI Alexa 65 cinema camera rig with anamorphic lens |
| Detangle Cloth | Cloth | Detangles points against a collider object without simulation |
| Fake Wind Cloth | Cloth | Noise-based wind effect for cloth meshes without simulation |
| Fake Wind Hair Curves | Hair | Noise-based wind effect for hair curves without simulation |
| Rainy Surface | Geometry | Generates and simulates raindrops on a surface |
| Rainy Surface Material | Material | Rainy surface shader that accepts attributes from the Rainy Surface geometry nodes |
| Points to Liquid Mesh | Geometry | Meshes a set of points into a liquid-like surface using SDF |
| Point Velocity | Utility | Calculates point velocity from a deforming geometry (requires constant point count) |

## Requirements

- **Blender 5.1 or later**

## Download & Install

### Option A — Download as ZIP (recommended for most users)

1. Go to the [repository page on GitHub](https://github.com/vngnc3/mf-assets)
2. Click the green **`<> Code`** button near the top-right
3. Click **Download ZIP**
4. Extract the ZIP to a **permanent location** on your computer — for example:
   - **Windows:** `C:\Users\<YourName>\Documents\mf-assets`
   - **macOS:** `/Users/<YourName>/Documents/mf-assets`
   - **Linux:** `/home/<YourName>/Documents/mf-assets`

> **Important:** Do **not** extract it into a temporary folder like Downloads or Desktop. Blender needs to reference these files every time you use the assets, so the folder must stay in a fixed location.

### Option B — Clone with Git

> Using clone is recommended if you are comfortable with the terminal — updates are a single command.

```bash
git clone https://github.com/vngnc3/mf-assets.git
```

Store the cloned folder in a permanent location as described above.

## Setting Up the Asset Library in Blender

1. Open Blender
2. Go to **Edit → Preferences** (macOS: **Blender → Preferences**)
3. In the Preferences window, click **File Paths** in the left sidebar
4. Scroll down to the **Asset Libraries** section
5. Click the **`+`** (Add) button
6. Navigate to the **`assets`** folder inside the extracted/cloned `mf-assets` directory and confirm
7. The library will appear in the list — you can rename it to **MF Assets** if you like
8. **Set the import mode to Append:** In the same Asset Libraries section, look for the import method dropdown next to the library entry and set it to **Append** (not Link)
9. Close the Preferences window

You should now see a **MF Assets** (or `_MF Assets`) entry in the dropdown at the top of the **Asset Browser** editor.

## Using the Assets

1. Open the **Asset Browser** editor in Blender (any window can be switched to this type)
2. Select **MF Assets** from the library dropdown at the top
3. Browse or search for the asset you want
4. **Important — use Append mode:**
   - In the Asset Browser's top bar, make sure the import mode is set to **Append** (not Link)
   - If you don't see this option, click the dropdown near the top of the Asset Browser and switch it to **Append**
5. **Drag and drop** the asset from the Asset Browser into your 3D Viewport, or double-click it

> **Why Append?** Append makes a full, independent copy of the asset in your scene. Link creates a reference to the library file, which can cause issues if the library file is moved or updated. For these tools, Append is the correct and safest option.

## Updating

### If you cloned with Git

1. Open a terminal in the `mf-assets` folder
2. Run:
   ```bash
   git pull
   ```
3. Restart Blender (or reload the asset library)

### If you downloaded as ZIP

1. Download the new ZIP from GitHub
2. Extract it, **replacing** the old `mf-assets` folder
3. Restart Blender (or reload the asset library)

## License

This project is licensed under the [MIT License](LICENSE).

---

### If you read this, check out our works :)

Mata Foundry™ is a small group of artists, designers, and engineers producing scalable 3D/CG works for clients worldwide.

- [https://mata.bot/](https://www.mata.bot/)
- [Instagram](https://www.instagram.com/matafoundry/)
