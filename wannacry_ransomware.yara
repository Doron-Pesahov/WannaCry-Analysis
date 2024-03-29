rule WannaCry_Detector {
    
    meta: 
        last_updated = "2024-03-09"
        author = "Doron Pesahov"
        description = "Yara Rule for detectng WannaCry Ransomware on the host"

    strings:
        // Identifying strings and other criteria for WannaCry
        $URL = "www.iuqerfsodp9ifjaposdfjhgosurijfaewrwergwea.com" ascii
        $PE_magic_byte = "MZ"
        $common_file_ext1 = ".WNCRY"
        $common_file_ext2 = ".wnry"
        $dropped_exe1 = "WanaDecryptor"
        $dropped_exe2 = "tasksche.exe"
        $dropped_exe3 = "taskhsvc.exe"
        $dropped_exe4 = "taskdl.exe"
        $dropped_exe5 = "taskse.exe"

    condition:
        $PE_magic_byte at 0 and ($common_file_ext1 or $common_file_ext2) and 
        ($URL or $dropped_exe1 or $dropped_exe2 or $dropped_exe3 or $dropped_exe4 or $dropped_exe5)
}
