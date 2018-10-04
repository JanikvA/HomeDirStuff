void saveCanvas(TCanvas* c,string name)
{
	string plot_dir="/afs/desy.de/user/a/ahnenjan/public/Plots/";
	c->SaveAs((plot_dir+name+".pdf").c_str());
	c->SaveAs((plot_dir+name+".C").c_str());
}
