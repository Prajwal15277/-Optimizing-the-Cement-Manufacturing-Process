#pip install pandas
import pandas as pd

# Read data into python
cement_data = pd.read_csv("Dataset.csv")

cement_data.describe()
cement_data.info()
cement_data.dtypes

cement_data.mean()
cement_data.median()

# Finding Duplicates
duplicate = cement_data.duplicated()  # Returns Boolean Series denoting duplicate rows.
duplicate
sum(duplicate)

# Null values
null_values = cement_data.isnull().sum()
print(null_values)


residue_summary = cement_data['Residue'].describe()
print(residue_summary)


# Exploratory Data Analysis
# Measures of Central Tendency / First moment business decision
cement_data.Residue.mean() 
cement_data.Residue.median()
cement_data.Residue.mode()

cement_data.Blaine.mean() 
cement_data.Blaine.median()
cement_data.Blaine.mode()

cement_data.C3A.mean() 
cement_data.C3A.median()
cement_data.C3A.mode()

cement_data.C4AF.mean() 
cement_data.C4AF.median()
cement_data.C4AF.mode()

cement_data.G_SO3.mean() 
cement_data.G_SO3.median()
cement_data.G_SO3.mode()

cement_data.G_Moisture.mean() 
cement_data.G_Moisture.median()
cement_data.G_Moisture.mode()

cement_data.FA_Blaine.mean() 
cement_data.FA_Blaine.median()
cement_data.FA_Blaine.mode()

cement_data.Gypsum_Weigh_Feeder_TPH.mean() 
cement_data.Gypsum_Weigh_Feeder_TPH.median()
cement_data.Gypsum_Weigh_Feeder_TPH.mode()

cement_data.Fly_Ash_SFF_TPH.mean() 
cement_data.Fly_Ash_SFF_TPH.median()
cement_data.Fly_Ash_SFF_TPH.mode()

cement_data.Drive_Power_MILL_KW.mean() 
cement_data.Drive_Power_MILL_KW.median()
cement_data.Drive_Power_MILL_KW.mode()

cement_data.Separator_speed_RPM.mean() 
cement_data.Separator_speed_RPM.median()
cement_data.Separator_speed_RPM.mode()

cement_data.Position_Master_Roller1_mm.mean() 
cement_data.Position_Master_Roller1_mm.median()
cement_data.Position_Master_Roller1_mm.mode()

cement_data.Counter_Pressure_HLSM_mm.mean() 
cement_data.Counter_Pressure_HLSM_mm.median()
cement_data.Counter_Pressure_HLSM_mm.mode()

cement_data.Hydraulic_pressure.mean() 
cement_data.Hydraulic_pressure.median()
cement_data.Hydraulic_pressure.mode()

cement_data.Fan_Power_Kw.mean() 
cement_data.Fan_Power_Kw.median()
cement_data.Fan_Power_Kw.mode()




# Measures of Dispersion / Second moment business decision
cement_data.Residue.var() # variance
cement_data.Residue.std() # standard deviation
range = max(cement_data.Residue) - min(cement_data.Residue) # range
range

cement_data.Blaine.var() # variance
cement_data.Blaine.std() # standard deviation
range = max(cement_data.Blaine) - min(cement_data.Blaine) # range
range

cement_data.C3A.var() # variance
cement_data.C3A.std() # standard deviation
range = max(cement_data.C3A) - min(cement_data.C3A) # range
range

cement_data.C4AF.var() # variance
cement_data.C4AF.std() # standard deviation
range = max(cement_data.C4AF) - min(cement_data.C4AF) # range
range

cement_data.G_SO3.var() # variance
cement_data.G_SO3.std() # standard deviation
range = max(cement_data.G_SO3) - min(cement_data.G_SO3) # range
range

cement_data.G_Moisture.var() # variance
cement_data.G_Moisture.std() # standard deviation
range = max(cement_data.G_Moisture) - min(cement_data.G_Moisture) # range
range

cement_data.FA_Blaine.var() # variance
cement_data.FA_Blaine.std() # standard deviation
range = max(cement_data.FA_Blaine) - min(cement_data.FA_Blaine) # range
range

cement_data.Gypsum_Weigh_Feeder_TPH.var() # variance
cement_data.Gypsum_Weigh_Feeder_TPH.std() # standard deviation
range = max(cement_data.Gypsum_Weigh_Feeder_TPH) - min(cement_data.Gypsum_Weigh_Feeder_TPH) # range
range

cement_data.Fly_Ash_SFF_TPH.var() # variance
cement_data.Fly_Ash_SFF_TPH.std() # standard deviation
range = max(cement_data.Fly_Ash_SFF_TPH) - min(cement_data.Fly_Ash_SFF_TPH) # range
range

cement_data.Drive_Power_MILL_KW.var() # variance
cement_data.Drive_Power_MILL_KW.std() # standard deviation
range = max(cement_data.Drive_Power_MILL_KW) - min(cement_data.Drive_Power_MILL_KW) # range
range

cement_data.Separator_speed_RPM.var() # variance
cement_data.Separator_speed_RPM.std() # standard deviation
range = max(cement_data.Separator_speed_RPM) - min(cement_data.Separator_speed_RPM) # range
range

cement_data.Position_Master_Roller1_mm.var() # variance
cement_data.Position_Master_Roller1_mm.std() # standard deviation
range = max(cement_data.Position_Master_Roller1_mm) - min(cement_data.Position_Master_Roller1_mm) # range
range

cement_data.Counter_Pressure_HLSM_mm.var() # variance
cement_data.Counter_Pressure_HLSM_mm.std() # standard deviation
range = max(cement_data.Counter_Pressure_HLSM_mm) - min(cement_data.Counter_Pressure_HLSM_mm) # range
range

cement_data.Hydraulic_pressure.var() # variance
cement_data.Hydraulic_pressure.std() # standard deviation
range = max(cement_data.Hydraulic_pressure) - min(cement_data.Hydraulic_pressure) # range
range

cement_data.Fan_Power_Kw.var() # variance
cement_data.Fan_Power_Kw.std() # standard deviation
range = max(cement_data.Fan_Power_Kw) - min(cement_data.Fan_Power_Kw) # range
range




# Third moment business decision
cement_data.Residue.skew()



# Fourth moment business decision
cement_data.Residue.kurt()
