permissionset 50200 AGT_PDFPreview
{
    Assignable = true;
    Permissions = tabledata PDFSetup=RIMD,
        tabledata PDFViewerBuffer=RIMD,
        table PDFSetup=X,
        table PDFViewerBuffer=X,
        codeunit GetPDFDataMeth=X,
        codeunit OpenPdfViewerMeth=X,
        codeunit PDFViewerSetup=X,
        page PdfSetup=X,
        page PDFViewer=X,
        page PDFViewerPart=X;
}