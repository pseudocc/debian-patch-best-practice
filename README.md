# DEBIAN-PATCH-BEST-PRACTICE

Fundamental ways to create a quilt patch.

## When you do not have a patch file: you edit files inline on your own.

### Solution 1:

```bash
quilt new {patch}
quilt add {file}
quilt edit {file}

# edit the files in your text editor
# then update the quilt patch
quilt refresh

# optional: edit the patch header
quilt header -e
```

### Solution 2:

```bash
# edit the files in your text editor

# create a patch and complete the patch header
dpkg-source --commit

# then update the quilt patch
quilt refresh

```

## When you have a patch file.

### Solution 1:

```bash
patch {patch}

# create a patch and complete the patch header
dpkg-source --commit

# then update the quilt patch
quilt refresh
```

### Solution 2:

```bash
cp {patch} debian/patches

# append your patch name to the end of the file
vi debian/patches/series

# apply all patches
quilt push -a

# then update the quilt patch
quilt refresh

# optional: edit the patch header
quilt header -e
```

## Edit existing patch.

```bash
quilt pop -a
quilt push {patch}

# edit files in your text editor
# run these two if needed
quilt add {file}
quilt edit {file}

# then update the quilt patch
quilt refresh

# optional: edit the patch header
quilt header -e
```

## Generate a debdiff for SRU.

```bash
# Create a patch or edit an existing one

# Increase the changelog version
dch -i

# Build the debian source package
debuild -S

# Generate the debdiff
debdiff > {cool-name}.debdiff
```
