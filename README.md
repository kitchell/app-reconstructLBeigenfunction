<h1 align="center">Reconstruct Surfaces from LB Eigenfunctions</h1>

<p align="center">
  Reconstructs each VTK surface mesh from its first Laplace-Beltrami eigenfunctions with compiled MATLAB code and outputs the reconstructed surfaces and comparison images.
</p>

<p align="center">
  <a href="https://github.com/brainlife/abcd-spec"><img src="https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg" alt="ABCD Spec v1.1"></a>
  <a href="https://doi.org/10.25663/bl.app.36"><img src="https://img.shields.io/badge/Brainlife-bl.app.36-blue.svg" alt="Run on brainlife.io"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-see_LICENSE-lightgrey.svg" alt="License"></a>
</p>

## At a glance

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **Reconstructs each VTK surface mesh from its first Laplace-Beltrami eigenfunctions with compiled MATLAB code and outputs the reconstructed surfaces and comparison images.**

For each .vtk surface in the input (or a single named surface when single_surf is true), computes spectrum_size Laplace-Beltrami eigenfunctions and reconstructs the mesh from them, saving the reconstructed surfaces and six views each of the original and reconstructed shapes. Use it to see how much shape detail a given number of eigenfunctions captures before Laplace-Beltrami shape analysis. Meshes with too few vertices are skipped.

| | |
|---|---|
| **Inputs** | `neuro/3Dsurfaces` |
| **Outputs** | `generic/images` · `neuro/3Dsurfaces` |
| **Container** | `brainlife/mcr:neurodebian1604-r2017a` |
| **Resources** | 8 CPUs · 31 GB memory · 8 h walltime |
| **Run it** | [doi.org/10.25663/bl.app.36](https://doi.org/10.25663/bl.app.36) |

#### Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `surfaces` | `neuro/3Dsurfaces` | yes | Directory of triangle surface meshes in VTK format. Only *.vtk files are read. |

#### Outputs

| Output | Datatype | Description |
|---|---|---|
| `images` | `generic/images` | PNG images (listed in images.json) showing six views of each original and reconstructed surface. |
| `surfaces` | `neuro/3Dsurfaces` | Surfaces reconstructed from the selected number of Laplace-Beltrami eigenfunctions. |

<details>
<summary><b>Parameters</b> (3)</summary>

| Parameter | Type | Default | Description |
|---|---|---|---|
| `single_surf` | boolean | `false` | only reconstruct a single surface |
| `singlesurf_filename` | string |  | Include the full filename of the surface you want to reconstruct. Best practice is to copy it directly from the 3D surfaces app output |
| `spectrum_size` | number | `50` | Number of Laplace-Beltrami eigenfunctions used to reconstruct each surface. |

</details>

<!-- brainlife-app:end -->

## Running the App

### On brainlife.io

Open the App at [doi.org/10.25663/bl.app.36](https://doi.org/10.25663/bl.app.36), choose `neuro/3Dsurfaces` from your project, set the parameters and press **Execute**. The results are saved to your project as `generic/images`, `neuro/3Dsurfaces`.

### Locally

You need [Singularity/Apptainer](https://apptainer.org/) (the App runs in `brainlife/mcr:neurodebian1604-r2017a`), [`jq`](https://jqlang.github.io/jq/).

1. Clone this repository.
2. Create `config.json` with the paths to your inputs and the parameters:

   ```json
   {
       "surfaces": "/path/to/surfaces/surfaces",
       "single_surf": false,
       "singlesurf_filename": "",
       "spectrum_size": 50
   }
   ```

3. Run `./main`.

## Troubleshooting

- **files missing**: Check that the input contains readable .vtk meshes and that singlesurf_filename matches a file when single_surf is true.

## Citing

If you use this App, please cite it, the software it builds on and brainlife.io:

- Reconstruct Surfaces from LB Eigenfunctions. brainlife.io App. [doi:10.25663/bl.app.36](https://doi.org/10.25663/bl.app.36)
- Kitchell L. Shape Analysis of Human White Matter Tracts: An Examination of Normal Morphological Variability and the Association Between Morphology, Brain Size, and Behavior. Indiana University (2020).
- Kitchell, Lindsey. Shape Analysis of Human White Matter Tracts: An Examination of Normal Morphological Variability and the Association Between Morphology, Brain Size, and Behavior. Indiana University. 2020
- Hayashi S, Caron BA, Heinsfeld AS, et al. brainlife.io: a decentralized and open-source cloud platform to support neuroscience research. *Nature Methods* 21:809–813 (2024). [doi:10.1038/s41592-024-02237-2](https://doi.org/10.1038/s41592-024-02237-2)
- Avesani P, McPherson B, Hayashi S, et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. *Scientific Data* 6:69 (2019). [doi:10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)

## Authors

- Lindsey Kitchell

## Funding

[![Wellcome-226486/Z/22/Z](https://img.shields.io/badge/Wellcome-226486%2FZ%2F22%2FZ-purple.svg)](https://wellcome.org/)
[![NIH-NINDS-U24NS140384](https://img.shields.io/badge/NIH_NINDS-U24NS140384-green.svg)](https://reporter.nih.gov/project-details/11261037)
[![NIH-NINDS-UM1NS132207](https://img.shields.io/badge/NIH_NINDS-UM1NS132207-green.svg)](https://reporter.nih.gov/project-details/11411328)
[![NIH-NIBIB-R01EB029272](https://img.shields.io/badge/NIH_NIBIB-R01EB029272-green.svg)](https://reporter.nih.gov/project-details/10262925)
[![NIH-NIBIB-R01EB030896](https://img.shields.io/badge/NIH_NIBIB-R01EB030896-green.svg)](https://reporter.nih.gov/project-details/10428625)
[![NIH-NIMH-R01MH126699](https://img.shields.io/badge/NIH_NIMH-R01MH126699-green.svg)](https://reporter.nih.gov/project-details/10460628)
[![NIH-NIDCD-R01DC020088](https://img.shields.io/badge/NIH_NIDCD-R01DC020088-green.svg)](https://reporter.nih.gov/project-details/11140284)
[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-2203524](https://img.shields.io/badge/NSF_BCS-2203524-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2203524)
[![NSF-IIS-1636893](https://img.shields.io/badge/NSF_IIS-1636893-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NSF-OAC-2148729](https://img.shields.io/badge/NSF_OAC-2148729-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148729)
[![NSF-IIS-1912270](https://img.shields.io/badge/NSF_IIS-1912270-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1912270)
[![NSF-IIS-2148700](https://img.shields.io/badge/NSF_IIS-2148700-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148700)
[![NSF-OAC-1916518](https://img.shields.io/badge/NSF_OAC-1916518-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1916518)

<sub>brainlife.io, which runs this App, is publicly funded by Wellcome, the U.S. National Institutes of Health and the U.S. National Science Foundation; acknowledging that support helps keep it running.</sub>

## License

See [LICENSE](LICENSE).
