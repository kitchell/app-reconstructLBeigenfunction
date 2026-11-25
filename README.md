[![Abcdspec-compliant](https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg)](https://github.com/brain-life/abcd-spec)
[![Run on Brainlife.io](https://img.shields.io/badge/Brainlife-bl.app.36-blue.svg)](https://doi.org/10.25663/bl.app.36)

# app-reconstructLBeigenfunction

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **Reconstructs each VTK surface mesh from its first Laplace-Beltrami eigenfunctions with compiled MATLAB code and outputs the reconstructed surfaces and comparison images.**

For each .vtk surface in the input (or a single named surface when single_surf is true), computes spectrum_size Laplace-Beltrami eigenfunctions and reconstructs the mesh from them, saving the reconstructed surfaces and six views each of the original and reconstructed shapes. Use it to see how much shape detail a given number of eigenfunctions captures before Laplace-Beltrami shape analysis. Meshes with too few vertices are skipped.

| | |
|---|---|
| 📥 **Inputs** | `neuro/3Dsurfaces` |
| 📤 **Outputs** | `generic/images` · `neuro/3Dsurfaces` |
| 🐳 **Container** | `brainlife/mcr:neurodebian1604-r2017a` |
| ⚙️ **Resources** | 8 CPUs · 31 GB memory · 8 h walltime |
| 🔗 **Run it** | [doi.org/10.25663/bl.app.36](https://doi.org/10.25663/bl.app.36) |

#### 📥 Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `surfaces` | `neuro/3Dsurfaces` | yes | Directory of triangle surface meshes in VTK format. Only *.vtk files are read. |

#### 📤 Outputs

| Output | Datatype | Description |
|---|---|---|
| `images` | `generic/images` | PNG images (listed in images.json) showing six views of each original and reconstructed surface. |
| `surfaces` | `neuro/3Dsurfaces` | Surfaces reconstructed from the selected number of Laplace-Beltrami eigenfunctions. |

<details>
<summary><b>⚙️ Parameters</b> (3)</summary>

| Parameter | Type | Default | Description |
|---|---|---|---|
| `single_surf` | boolean | `false` | only reconstruct a single surface |
| `singlesurf_filename` | string |  | Include the full filename of the surface you want to reconstruct. Best practice is to copy it directly from the 3D surfaces app output |
| `spectrum_size` | number | `50` | Number of Laplace-Beltrami eigenfunctions used to reconstruct each surface. |

</details>

📚 **References used by this App:**
- Kitchell L. Shape Analysis of Human White Matter Tracts: An Examination of Normal Morphological Variability and the Association Between Morphology, Brain Size, and Behavior. Indiana University (2020).
- Avesani P, et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. Sci Data 6:69 (2019). [doi:10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)

<!-- brainlife-app:end -->

This application will reconstruct the individual surfaces based on the number of selected eigenfunctions. 

### Author
- Lindsey Kitchell (kitchell@indiana.edu)

### Funding 
[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-1636893](https://img.shields.io/badge/NSF_BCS-1636893-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NSF-ACI-1916518](https://img.shields.io/badge/NSF_ACI-1916518-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1916518)
[![NSF-IIS-1912270](https://img.shields.io/badge/NSF_IIS-1912270-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1912270)
[![NIH-NIBIB-R01EB029272](https://img.shields.io/badge/NIH_NIBIB-R01EB029272-green.svg)](https://grantome.com/grant/NIH/R01-EB029272-01)

### Citations
We kindly ask that you cite the following articles when publishing papers and code using this code. 

1. Kitchell, Lindsey. Shape Analysis of Human White Matter Tracts: An Examination of Normal Morphological Variability and the Association Between Morphology, Brain Size, and Behavior. Indiana University. 2020
2. Avesani, P., McPherson, B., Hayashi, S. et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. Sci Data 6, 69 (2019). [https://doi.org/10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)


## Running the App 

### On Brainlife.io

You can submit this App online at [https://brainlife.io/app/5b0614c6d85b030192ff6aae](https://brainlife.io/app/5b0614c6d85b030192ff6aae) via the "Execute" tab.

### Running Locally (on your machine)

1. git clone this repo.
2. Inside the cloned directory, create `config.json` with something like the following content with paths to your input files.

```json
{
    "single_surf": false,
    "singlesurf_filename": "",
    "spectrum_size": 10,
    "surfaces": "../5bb272ea8b415c002a21a76b/5b26abccd821b2004f932b09/surfaces"
}
```
If you have singlarity install on your local machine:

3. Launch the App by executing `main`

```bash
./main
```

Otherwise:

3. execute main.m in matlab

### Sample Datasets

If you don't have your own input file, you can download sample datasets from Brainlife.io, or you can use [Brainlife CLI](https://github.com/brain-life/cli).


## Output

The output of this app will be a folder with images of the reconstructed tracts.

### Dependencies

This App only requires [singularity](https://www.sylabs.io/singularity/) to run. If you don't have singularity, you will need to install following dependencies.  

  - MATLAB: https://www.mathworks.com/products/matlab.html
  - JSONlab: https://www.mathworks.com/matlabcentral/fileexchange/33381-jsonlab-a-toolbox-to-encode-decode-json-files
  - geom3D: https://www.mathworks.com/matlabcentral/fileexchange/24484-geom3d
