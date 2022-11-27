from PyPDF2 import PdfFileMerger
import os

def get_pdf_list():
	"""
	Find pdf files in current directory.
	Assume files are 'chap1.pdf', 'chap2.pdf', ... 'chap68.pdf'
	"""
	
	total_num = 68
	fprefix = "chap"
	flist = []
	for i in range(total_num):
		fname = fprefix + str(i) + ".pdf"
		if os.path.isfile(fname) is False:
			print("[WARNING] File not found: {}".format(fname))
			continue
		flist.append(fname)
	return flist

def merge_pdfs(out_file_name = "completed_one.pdf"):
	"""
	Find files and merge them into one PDF file
	"""
	
	if os.path.isfile(out_file_name):
		print("[WARNING] Merged file already exists, exit...")
		return
	
	flist = get_pdf_list()
	if len(flist) == 0:
		print("[WARNING] No file was found to merge, exit...")
		return
	print("[MESSAGE] Total file to merge: ", len(flist))

	merger = PdfFileMerger()
	for fname in flist:
		merger.append(fname)
	merger.write(out_file_name)
	merger.close()
	print("[MESSAGE] Merging PDF files finished")


if __name__ == "__main__":
	ofname = './Handbook.of.Discrete.and.Computational.Geometry.pdf'
	merge_pdfs(ofname)
